#!/usr/bin/env bash

export PATH=$PATH:$(go env GOPATH)/bin

OPEN_EDITOR=code-insiders;
FILTER=fzf;

function frepository() {
    arg=${1:-$OPEN_EDITOR};
    project=$(ghq list | $FILTER);

    [ -z "$project" ] || {
        $arg $(ghq root)/$project;
    }
    unset arg;
    unset project;
}

function fhistory() {
    selected_command=$(history | cut -c 8- | sort | awk '{$1=$1};1' | egrep -v ${FUNCNAME[0]} | uniq | $FILTER);
    [ -z "$selected_command" ] || $selected_command;
    unset selected_command;
}

function fbranch() {
    branch=$(git branch | $FILTER | sed -e "s/[ *]//g");
    [ -z "$branch" ] || git checkout $branch;
    unset branch;
}

function fpr() {
    pr_number=$(hub pr list | $FILTER | awk '{print $1}' | cut -b 2-);
    [ -z "$pr_number" ] || hub pr checkout $pr_number;
    unset pr_number;
}