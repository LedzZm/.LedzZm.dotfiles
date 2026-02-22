source "/usr/share/cachyos-fish-config/cachyos-config.fish"

function fish_greeting
    # Reset cachyos fish_greeting. For now this will remain empty.
end

# TODO: Once stable convert to https://superuser.com/a/1688606
abbr -a gs 'git status'
abbr -a ga 'git add'
abbr -a gd 'git diff'

# Manage dotfiles via a --separate-git-dir setup.
abbr -a dotfiles '/usr/bin/git --git-dir=$HOME/.LedzZm.dotfiles/ --work-tree=$XDG_CONFIG_HOME/'

# TODO: Comment and group.
# Sanity alias for scripts.
alias nvm='fnm'

# TODO: Move to other file or group
#set -gx PHPSTORM_JDK /usr/lib/jvm/default

# Enable fzf keybindings. (CTRL-r/t/c)
fzf --fish | source

# Active fish theme. 
fish_config theme choose "Catppuccin Macchiato"

# Should better be kept at the end of the file
starship init fish | source
