#!/bin/bash

# 17/11/2017
# Thomas Holmes
# Simple Qt .ui to .py convertor
# Meant for use in conjunction with nautilus-actions.

filename=$1

if [ -e $filename.py ]
then
    notify-send "Cannot complete conversion" \ "$filename.py already exists."
elif [ -e $filename.ui ]
then
    pyuic4 -o $filename.py $filename.ui
    notify-send "Conversion completed" \ "$filename.ui > $filename.py"
else
    notify-send "Cannot complete conversion" \ "$filename.ui does not exist."
fi
