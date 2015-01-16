#!/bin/sh
TO_BACK_UP="/files/bkp_linux"$HOME

if [ ! -d $TO_BACK_UP ]; then
  echo "The directory do not exist: " $TO_BACK_UP
  mkdir -p $TO_BACK_UP
  if [ ! -d $TO_BACK_UP ]; then
    echo "It was not possible make the directory: " $TO_BACK_UP
    set -e
  else
    echo "The directory is created: " $TO_BACK_UP
  fi
else
  echo "The directory already exist: " $TO_BACK_UP
fi

# TODO - convert 'exclude' to dinamically pattern in an array
echo "Start backuping..."
rsync -r --exclude="Google\ Drive/" --exclude="Dropbox/" $HOME/ $TO_BACK_UP --progress
echo "Backup is finished."
