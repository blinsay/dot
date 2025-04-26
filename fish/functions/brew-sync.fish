function brew-sync --description "sync homebrew from a config file"
    brew bundle install --cleanup --file=~/dot/Brewfile
end
