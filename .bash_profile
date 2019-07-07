OPEN_EDITOR=code-insiders;
FILTER=fzf;

function fproject() {
    project=$(ghq list | $FILTER);

    [ -z "$project" ] || {
	$OPEN_EDITOR $(ghq root)/$project;
    }
    unset project;
}

function fhistory() {
    command=$(history | cut -c 8- | sort | awk '{$1=$1};1' | egrep -v ${FUNCNAME[0]} | uniq | fzf);
    [ -z "$command" ] || $command;
    unset command;
}