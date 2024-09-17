for dot_dir in "$(dirname $(readlink -f ~/.config/fish/config.fish))"
  for file in $dot_dir/fish/*
    source $file
  end
end

