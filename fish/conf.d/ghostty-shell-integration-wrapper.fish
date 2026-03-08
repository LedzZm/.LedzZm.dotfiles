#if test "$TERM" = xterm-ghostty; or set -q GHOSTTY_BIN_DIR
#
#    printf aaa
#
#end
set -g DEFAULT_BG (ghostty +show-config | grep ^background | awk -F'=' '{print $2}' | tr -d '[:space:]')

function install_ssh_wrapper --on-event fish_preexec
    if functions -q ssh
        if not functions -q ssh_ghostty
            functions -c ssh ssh_ghostty
        end
    end

    printf AAA

    function ssh --wrap=ssh --description "Wrap ghostty ssh wrapper to change terminal background color when connecting via ssh."

        printf BBB
        set -l server ""
        # Parse arguments to find the host (skips flags).
        for arg in $argv
            if not string match -q -- "-*" $arg
                set server $arg
            end
        end
        # Remove user@ prefix if present.
        set server (string replace -r '.*@' '' $server)
        printf "\033]11;%s\007" (server_bg $server)
        # Use the ghostty wrapped ssh.

        if functions -q ssh_ghostty

            printf GHOSTTY

            ssh_ghostty $argv
        else
            printf ALAC
            command ssh $argv
        end
        # Force background reset after session end.
        background_reset
    end
end

# Function to reset background
function background_reset
    printf "\033]110\007"
    printf "\033]11;%s\007" $DEFAULT_BG
end
# Function returning background color for a server
function server_bg
    switch $argv[1]
        case "*.web-bunch.com"
            echo "#422a00"
        case '*'
            echo "#000969"
    end
end

exit

if test -n "$bg"

else
    command ssh $argv
    background-reset
end
