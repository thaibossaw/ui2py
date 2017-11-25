#!/bin/bash

# 17/11/2017
# Thomas Holmes
# Simple Qt .ui to .py converter
# Meant for use in conjunction with nautilus-actions.

filename=$1
stop=1

# Check the UI file exists...
if [ -e ${filename}.ui ]
then
    stop=0
else
    notify-send "Conversion Cancelled" \ "${filename}.ui does not exist."
    stop=1
fi

# Check the Py file exists...
if [ -e ${filename}.py ]
then
    zenity --question --title "Overwrite file?" --text "The file ${filename}.py already exists. Overwrite?"
    if [ $? == 1 ]
    then
        notify-send "Conversion Cancelled" \ "User aborted operation."
        stop=1
    fi
else
    stop=0
fi

# Convert file...
if [ $stop == 0 ]
then
    pyuic4 -o ${filename}.py ${filename}.ui
    notify-send "Conversion completed" \ "${filename}.ui > ${filename}.py"
fi