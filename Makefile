.PHONY: all
all: gitconfig tmux garf

# TODO(benl): zshrc

.PHONY: tmux
tmux:
	@echo "+ $@"
	ln -fs $(CURDIR)/.tmux.conf $(HOME)/.tmux.conf
	ln -fs $(CURDIR)/.theme.tmux.conf $(HOME)/.theme.tmux.conf

# TODO(benl): does it make sense include a gitconfig??
.PHONY: gitconfig
gitconfig:
	@echo "+ $@"
	ln -sf $(CURDIR)/.gitignore $(HOME)/.gitignore
	git config --global core.excludesfile ~/.gitignore

.PHONY: garf
garf:
	@echo "+ $@"
	@echo ""
	@echo "\033[0;35m"
	@cat .odie
	@echo "\033[0m"
	@echo ""
