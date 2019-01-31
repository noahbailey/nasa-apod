#!/bin/bash
# Set desktop background to a specified image under the XFCE desktop environment
# Poor people with bad computers edition

# https://askubuntu.com/questions/380550/xubuntu-how-to-set-the-wallpaper-using-the-command-line

if ! [ -f $1 ]
then
    echo "File not found!"
    exit 1
fi

echo "Set desktop to $1"

xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor0/image-path --set $1