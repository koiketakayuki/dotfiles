OPEN_EDITOR=code-insiders;
FILTER=fzf;

function fproject() {
    arg=${1:-$OPEN_EDITOR};
    project=$(ghq list | $FILTER);

    [ -z "$project" ] || {
        $arg $(ghq root)/$project;
    }
    unset arg;
    unset project;
}

function fhistory() {
    command=$(history | cut -c 8- | sort | awk '{$1=$1};1' | egrep -v ${FUNCNAME[0]} | uniq | fzf);
    [ -z "$command" ] || $command;
    unset command;
}