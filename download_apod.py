#!/usr/bin/python

# Astronomy Picture Of the Day

# https://apod.nasa.gov/apod/astropix.html

# Get the astronomy picture, set it as desktop

import urllib.request
import datetime 
import os
from os.path import exists 
from html.parser import HTMLParser
from pathlib import Path

links = []

class MyParse(HTMLParser):
    def handle_starttag(self, tag, attrs):
        if tag=="img":
            #print(dict(attrs)["src"])
            links.append(dict(attrs)["src"])


src_domain = "apod.nasa.gov"
src_dir = "/apod/astropix.html"
src_url = "https://" + src_domain + src_dir 

today = datetime.datetime.today().strftime('%Y-%m-%d')


def get_image_link(): 
    print("Getting image link...")
    resource = urllib.request.urlopen(src_url)
    content = resource.read().decode(resource.headers.get_content_charset())
    parser = MyParse()
    parser.feed(content)
    img_link = "https://" + src_domain + '/apod/' + links[0]
    print(img_link)
    return img_link

def download_image(): 
    output_dir = str(Path.home()) + "/Pictures/apod"
    # check_dir(output_dir)
    img_file = output_dir + '/' + today + '.jpg'
    img_link = get_image_link()
    print(img_file)
    print("Downloading image...")
    urllib.request.urlretrieve(img_link, img_file)

download_image()

