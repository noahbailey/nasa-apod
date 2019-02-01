#!/bin/bash
# Set desktop background to a specified image under the KDE Plasma environment
# https://www.reddit.com/r/kde/comments/65pmhj/change_wallpaper_from_terminal/
# https://github.com/pashazz/ksetwallpaper/blob/master/ksetwallpaper.py

# Test input file: 
if ! [ -f $1 ]
then
    echo "File not found!"
    exit 1
fi

# Connect to dbus session (Required if running from outside a user's environment (ie. cron task))
# https://unix.stackexchange.com/questions/28463/run-a-dbus-program-in-crontab-how-to-know-about-the-session-id/28496

# Find PID of the plasmashell process for finding DBUS address: 
pid=$(pgrep plasmashell)
export $(</proc/$pid/environ tr \\0 \\n | grep -E '^DBUS_SESSION_BUS_ADDRESS=')

echo "Set desktop to $1"
plasma_template='var allDesktops = desktops();print (allDesktops);for (i=0;i<allDesktops.length;i++) {d = allDesktops[i];d.wallpaperPlugin = "org.kde.image";d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");d.writeConfig("Image", "file://@@")}'
qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "${plasma_template/@@/$1}"


