#!/usr/bin/env bash

###
### human.sh: Heuristics utility for man(1).
###

# Check if alias exists.
__is_alias() {
	local ALIAS="$1"

	alias "$ALIAS" >/dev/null 2>&1
	return $?
}

# Extract command from alias.
__get_alias_value() {
	local CUT="$(/usr/bin/which cut)"
	local TR="$(/usr/bin/which tr)"

	local ALIAS="$1"
	local VALUE="$(alias "$ALIAS" | $CUT -d'=' -f2 | $TR -d "'")"

	printf '%s\n' "$VALUE"
}

# Get usage information.
__get_human_usage() {
	local USAGE

read -r -d '' USAGE <<EOS
Usage: human [OPTIONS] <NAME>

OPTIONS:
  -h, --help      Show usage information.
  -v, --version   Show current version.
EOS

	printf '%s\n' "$USAGE"
}

# Get current version number.
__get_human_version() {
	local VERSION="1.0.0"

	printf '%s\n' "$VERSION"
}

human() {
	local MAN="$(/usr/bin/which man)"
	local ARGV=()

	while [[ $# -gt 0 ]]; do
		case $1 in
			-h|--help)
				__get_human_usage

				return 0
			;;
			-v|--version)
				__get_human_version

				return 0
			;;
			*)
				ARGV+=("$1")

				shift
			;;
		esac
	done

	local NAME="${ARGV[${#ARGV[@]}-1]}"

	if __is_alias "$NAME"; then
		local TMP=()
		local VALUE="$(__get_alias_value $NAME)"

		for ARG in "${ARGV[@]}"; do
			[[ "$ARG" != "$NAME" ]] && TMP+=("$ARG")
		done

		ARGV=("${TMP[@]}")

		if [[ "$VALUE" != "${FUNCNAME[0]}" ]]; then
			ARGV+=("$VALUE")
		else
			ARGV+=("$NAME")
		fi
	fi

	$MAN "${ARGV[@]}"
}

# Remove this alias if you would
# rather call `human` directly.
alias man='human'
