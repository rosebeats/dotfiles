#!/bin/bash

NUM=$(python3 -c "import json; print(next(filter(lambda w: w['focused'], json.loads('$(i3-msg -t get_workspaces)')))['num'])")
OLDNAME=$(python3 -c "import json; print(next(filter(lambda w: w['focused'], json.loads('$(i3-msg -t get_workspaces)')))['name'])" | cut -c 4-)
NEWNAME=$(zenity --text="New name:" --entry --title="Rename workspace $NUM" --entry-text="${OLDNAME}")
if [ $? -eq 0 ]
then
    if [[ $NEWNAME =~ ^[0-9a-zA-Z]*$ ]]
    then
        if [ -z ${NEWNAME} ]
        then
            i3-msg "rename workspace to \"$NUM\""
        else
            i3-msg "rename workspace to \"$NUM: ${NEWNAME}\""
        fi
    fi
fi
