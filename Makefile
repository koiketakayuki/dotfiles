## -*- mode: makefile-gmake; -*-

.PHONY: all
all: bash ssh osx-config homebrew

.PHONY: bash
	ln -vsf ${PWD}/.bash_profile ${HOME}

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