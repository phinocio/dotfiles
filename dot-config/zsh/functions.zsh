chpwd() {
	if test "$(pwd)" = "$(git rev-parse --show-toplevel 2> /dev/null)"; then
		name="git-fetch"$(pwd | tr /. - )

		if [ ! -f /tmp/$name ]; then
			git fetch
			notify-send "Ran git fetch in $(pwd)" --icon=$HOME/.local/share/icons/git-diff.svg
			touch /tmp/$name
		fi
	fi
}

spf() {
    os=$(uname -s)

    # Linux
    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
    fi

    # macOS
    if [[ "$os" == "Darwin" ]]; then
        export SPF_LAST_DIR="$HOME/Library/Application Support/superfile/lastdir"
    fi

    command spf "$@"

    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
}
