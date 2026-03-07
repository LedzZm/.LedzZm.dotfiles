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
        function ssh --wrap=ssh --description "Wrap ghostty ssh wrapper to change terminal background color when connecting via ssh."
            printf "\033]11;%s\007" '#000000'
            ssh_ghostty $argv
            # Force background reset after session end.
            background_reset
        end
    end
end

# Function to reset background
function background_reset
    printf "\033]110\007"
    printf "\033]11;%s\007" $DEFAULT_BG
end

exit

# Function returning background color for a server
function server_bg
    switch $argv[1]
        case "server1.domain.tld"
            echo "#422a00"
        case '*'
            echo "#000969"
    end
end

# Function to change background color using OSC 11
function background-color
    printf "\033]11;%s\007" $argv[1]
end
# SSH wrapper
set -l server ""

# Find host argument (skip flags)
for arg in $argv
    if not string match -q -- "-*" $arg
        set server $arg
    end
end

# Remove user@ prefix
set server (string replace -r '.*@' '' $server)

set -l bg (server_bg $server)

if test -n "$bg"
    background-color $bg
    command ssh $argv
    background-reset
else
    command ssh $argv
    background-reset
end
