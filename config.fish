fish_add_path "/opt/homebrew/sbin"
fish_add_path "/opt/homebrew/bin/"

for dot_dir in "$(dirname $(readlink -f ~/.config/fish/config.fish))"
  for file in $dot_dir/fish/*
    source $file
  end
end

