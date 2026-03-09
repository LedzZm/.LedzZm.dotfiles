set -g default_bg (ghostty +show-config | grep ^background | awk -F'=' '{print $2}' | tr -d '[:space:]')

# Fire on preexec, because ghostty wrapper fires on fish_prompt, and we want to execute later.
function install_ssh_wrapper --on-event fish_preexec
    if functions -q ssh
        if not functions -q ssh_ghostty
            functions -c ssh ssh_ghostty
        end
    end
    function ssh --wrap=ssh --description "Wrap ghostty ssh wrapper to change terminal background and foreground color when connecting via ssh."
        set -l server ""
        # Parse arguments to find the host (skips flags).
        for arg in $argv
            if not string match -q -- "-*" $arg
                set server $arg
            end
        end
        # Remove user@ prefix if present.
        set server (string replace -r '.*@' '' $server)
        # Ensure the server is not an empty string (E.g. ssh -V).
        if test -n "$server"
            # Resolve and set the back/foreground colors, depending on the given domain.
            resolve_host_colors $server | read background foreground
            printf "\033]11;%s\007" $background
            printf "\033]10;%s\007" $foreground
        end
        # Use the ghostty wrapped ssh.
        if functions -q ssh_ghostty
            ssh_ghostty $argv
        else
            command ssh $argv
        end
        # Force background reset after session end.
        osc_reset
    end
end

# Function returning background color for a server
function resolve_host_colors
    set -l colors (host_colors_mapping $argv[1])
    if test -n "$colors"
        echo $colors
        return
    end

    # Lookup for the A record of the alias.
    set -l ip (dig +short $argv[1] A)
    if not test -n "$ip"
        return
    end
    set -l colors (host_colors_mapping $ip)
    if test -n "$colors"
        echo $colors
        return
    end

    # Reverse lookup for the main host name using the ip.
    set -l base_domain (dig +short -x $ip | string trim -r -c '.')
    if not test -n "$base_domain"
        return
    end
    set -l colors (host_colors_mapping $base_domain)
    if test -n "$colors"
        echo $colors
        return
    end

    # If the ip/base_domain are valid but no mapping was set
    # for the given host use the following defaults.
    echo "#000969" "#e6e6e6"
end
function host_colors_mapping -a host
    #set -l boring_blue '#000969 #e6e6e6'
    #set -l boring_dark '#000000 #e6e6e6'
    #set -l hackerman '#000000 #00ff00'
    set -l gruvbox '#282828 #ebdbb2'
    set -l light '#fafafa #383a42'

    set -l mapping \
        "sf_production $light" \
        "*.web-bunch.com $gruvbox"

    for entry in $mapping
        set -l parts (string split ' ' $entry)
        if string match -q $parts[1] $host
            echo $parts[2] $parts[3]
            return
        end
    end
end

# Function to reset background and foreground.
function osc_reset
    printf "\033]110\007"
    printf "\033]11%s\007" $default_bg
end
