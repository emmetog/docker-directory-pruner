#!/bin/bash

set -e

# Cleanup: keep last ${RECENT_FILES_TO_KEEP} files
cd "$DIR_TO_CLEAN"

FILES=$((ls -t "$DIR_TO_CLEAN"|head -n $((RECENT_FILES_TO_KEEP + 1 ));ls "$DIR_TO_CLEAN")|sort|uniq -u|sed -e 's,.*,"&",g')

if [ " $DRY_RUN " == " false " ]; then
  echo $FILES | xargs --no-run-if-empty rm -r
  echo "Cleanup complete"
else
  echo "Dry run detected, not deleting anything and listing files that woud be deleted instead:"
  FILES_ARRAY=( $FILES )
  for i in "${FILES_ARRAY[@]}"
  do
  	 echo "$i" | tr -d '"'
  done
fi




