#!/bin/bash

# Change to where nasa-apod is installed: 
SCRIPTBASE="$HOME/git/nasa-apod"

# Add script to user crontab:
(crontab -l ; echo "@hourly $SCRIPTBASE/nasa-apod.sh") | crontab -
