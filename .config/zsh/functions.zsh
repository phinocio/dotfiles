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
