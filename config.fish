set fish_greeting

set fish_color_user cyan
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_showdirtystate true
set __fish_git_prompt_showuntrackedfiles true

fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/bin
fish_add_path ~/go/bin

export EDITOR=hx

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.fish 2>/dev/null || :
