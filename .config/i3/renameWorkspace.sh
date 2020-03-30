#!/bin/bash

NUM=$(python3 -c "import json; print(next(filter(lambda w: w['focused'], json.loads('$(i3-msg -t get_workspaces)')))['num'])")
OLDNAME=$(python3 -c "import json; print(next(filter(lambda w: w['focused'], json.loads('$(i3-msg -t get_workspaces)')))['name'])" | sed -r 's/[0-9]+(: )?//g')
if [ $# -eq 0 ]
then
    NEWNAME=$(zenity --text="New name:" --entry --title="Rename workspace $NUM" --entry-text="${OLDNAME}")
else
    NEWNAME=$1
fi
if [ $? -eq 0 ] && echo $NEWNAME | grep -Eq "^[0-9a-zA-Z ]*$"
then
    if [ -z ${NEWNAME} ]
    then
        i3-msg "rename workspace to \"$NUM\""
    else
        i3-msg "rename workspace to \"$NUM: ${NEWNAME}\""
    fi
fi
