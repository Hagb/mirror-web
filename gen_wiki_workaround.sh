#!/bin/bash
usage="Usage: $0 PATH_TO_MIRROR
Generate workaround about _posts/help/*.md

   PATH_TO_MIRROR   path of mirror-wiki repository
"
DIR="$1/content/mirror-wiki/"
if [ ! \( -n "$1" -a -d "$DIR" \) ]
then
	echo "$usage" >&2
	exit 1
fi
git rm -r _posts/help/
rm -r _posts/help/
mkdir -p _posts/help/
for mirrorid in $(ls "$DIR")
do
	echo \
"---
category: help
layout: help
mirrorid: $mirrorid
---
" > _posts/help/1970-01-01-$mirrorid.md
done
git add _posts/help
