## -*- mode: makefile-gmake; -*-

.PHONY: all
all: bash fish ssh osx-config homebrew

.PHONY: bash
	ln -vsf ${PWD}/.bash_profile ${HOME}

.PHONY: fish
fish:
	curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
	ln -vsf ${PWD}/.config/fish/config.fish ${HOME}/.config/fish/
	ln -vsf ${PWD}/.config/fish/fishfile ${HOME}/.config/fish/

.PHONY: ssh
ssh:
	ln -vsf ${PWD}/.ssh/conf.d ${HOME}/.ssh/
	ln -vsf ${PWD}/.ssh/config ${HOME}/.ssh/

.PHONY: osx-config
osx-config:
	./osx-config.sh

.PHONY: homebrew
homebrew:
	ln -vsf ${PWD}/.Brewfile ${HOME}
	brew update;
	brew bundle --global
	brew autoupdate --delete
	brew autoupdate --start --upgrade --cleanup --enable-notification