#! /usr/bin/env bash

TIME=$(TZ='Asia/Shanghai' date '+%m%d_%H%M')

HASH="$(git rev-parse --short HEAD 2>/dev/null || :)"

DIFF=""
if git rev-parse --is-inside-work-tree >/dev/null 2>&1 &&
   ! git diff --quiet --ignore-submodules HEAD --
then
DIFF="$(git diff -b --numstat | awk '{
		if ($1 != "-") add += $1
		if ($2 != "-") del += $2
		files++
	} END {
		out = "f" files
		if (add > 0) out = out "_a" add
		if (del > 0) out = out "_d" del
		print out
	}')"
fi

if [ -n "$DIFF" ]; then
	DIFF="_${DIFF}"
fi

cd "$(dirname "$(readlink -f "$0")")" || exit 1

echo "{
	system.nixos.label = \"${TIME}_${HASH}${DIFF}\";
}" | tee ../build-label.nix
