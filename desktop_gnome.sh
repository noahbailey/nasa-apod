#!/bin/bash
# Set desktop background to a specified image under the Gnome desktop environment

# https://askubuntu.com/questions/783558/changing-desktop-background-in-bash?rq=1

if ! [ -f $1 ]
then
    echo "File not found!"
    exit 1
fi

echo "Set desktop to $1"

gsettings set org.gnome.desktop.background picture-uri "file://$1"

