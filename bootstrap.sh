#!/usr/bin/env bash

function setup() {
    copyConfigFiles;
    brewInstall;
}

function copyConfigFiles() {
    rsync --exclude ".git" \
	  --exclude "bootstrap.sh" \
      --exclude "LICENSE" \
      --exclude "README.md" \
	  -avh --no-perms . ~;
}

function brewInstall() {
    command -v brew > /dev/null 2>&1 || {
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    }
    brew update;
    brew bundle --global;
    brew autoupdate --start --upgrade --cleanup --enable-notification
}

function main() {
    if [ "$1" == "--force" -o "$1" == "-f" ]; then
	setup;
    else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n)" yn;
	case $yn in
	    [Yy]* ) setup ;;
            * ) exit;;
	esac
    fi;
}

main;

unset setup;
unset copyConfigFiles;
unset brewInstall;
unset main;
