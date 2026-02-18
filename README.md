Highly personalised dotfiles and install scripts

# Installation

Clone the repository as a bare repo into your home directory:
`git clone --bare git@github.com:LedzZm/.LedzZm.dotfiles.git $HOME/.LedzZm.dotfiles/
Then using you config directory as a worktree, sync all the repository's contents. **This might cause you to lose config... use reponsively.**

This repository ignores all files except those explicitly tracked (see .gitignore for details).

Untracked files will not be removed by accident **(Again... no promises)**

If you want to add more config directories, you will need to add them to the .gitignore exclusions.
`/usr/bin/git --git-dir=$HOME/.LedzZm.dotfiles/ --work-tree=$XDG_CONFIG_HOME/ checkout .`

You can then add an alias or abbreviation to your shell's config to execute git operations in a sane way (See fish/config.fish).

[A more detailed explanation can be found here.](https://wiki.archlinux.org/title/Dotfiles#Tracking_dotfiles_directly_with_Git)

> [!WARNING]
> Use scripts at your own risk... will probably break you system.
