set fish_greeting

fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/bin
fish_add_path ~/go/bin

export EDITOR=hx

for dot_dir in "$(dirname $(readlink -f ~/.config/fish/config.fish))"
    for file in $dot_dir/fish/*
        source $file
    end
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.fish 2>/dev/null || :
