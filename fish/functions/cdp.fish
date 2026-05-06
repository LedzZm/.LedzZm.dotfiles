function cdp --description 'Interactively select and cd to a directory under ~/Projects/'
    set -l dir (fd --max-depth=3 --type d --base-directory $HOME/Projects | fzf --prompt="Select project > ")
    if test -n "$dir"
        cd "$HOME/Projects/$dir"
    end
end
