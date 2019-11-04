#!/bin/bash

set -e

MOUNT="/run/media/lorenzo/Backup"
RSYNC_PATH="$HOME/Applications/rsync-time-backup"

if [[ -d "$MOUNT" ]]; then 
	printf "Backing up $HOME to $MOUNT...\n"
	$RSYNC_PATH/rsync_tmbackup.sh $HOME $MOUNT $RSYNC_PATH/exclude.txt
else
	echo "No drive mounted at $MOUNT"
fi
