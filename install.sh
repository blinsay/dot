#!/usr/bin/env bash

set -eux

# some simple bash to set up some symlinks.
#
# this does not install any software, just configuration files. it doesn't do
# it in a principled way that is easy to extend. it's just bash.

zshrc() {
    ln -fs "${PWD}"/.zshrc "${HOME}/.zshrc"
}

tmux_conf() {
	ln -fs "${PWD}"/.tmux.conf "${HOME}"/.tmux.conf
	ln -fs "${PWD}"/.theme.tmux.conf "${HOME}"/.theme.tmux.conf
}

gitconfig() {
    ln -sf "${PWD}"/.gitignore "${HOME}"/.gitignore
    git config --global core.excludesfile ~/.gitignore
}

zshrc
tmux_conf
gitconfig

set +x
echo -e "\033[0;35m"
cat .odie
echo -e "\033[0m"
