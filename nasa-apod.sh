#!/bin/bash
# This script represents the cron task. It requires no additional inputs since it knows what day it is and can connect to the internet. Mystical, I know. 

# Specify the home directory that contains the scripts: 
APODHOME="$HOME/git/nasa-apod"

# Define the desktop environment to use
# Only Plasma is implemented at the moment. 
# -- Options: 
#       -- plasma 
#       -- gnome
#       -- xfce
DESKTOP="plasma"

# Download the image: 
imgfile=$(python3 $APODHOME/download_apod.py)

if [ $? -ne 0 ]
then    
    echo "Could not download the image for some reason."
    exit 1
fi


# Set the image as desktop wallpaper: 
$APODHOME/desktop_$DESKTOP.sh $imgfile

# Fin. 