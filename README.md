# Astronomy Picture of the Day

## About

This set of scripts will automatically download the "Astronomy Picture of the Day" from NASA's website, save the file to a subdirectory of the user Pictures folder, then set the image as the desktop wallpaper. 

We support the following desktop environments: 

Desktop | Status
------- | ------
Plasma  | Tested
Gnome   | Untested
XFCE4   | Untested

> Let me know if it doesn't work on your system! Better yet, fix it and submit a pull request so I don't have to do any work!!

## Installation 

Clone this repository to your home directory. Modify the `nasa-apod.sh` script so that it contains your desktop environment and the path where the repository is located. 

Create a cron job that runs at least once a day. 

