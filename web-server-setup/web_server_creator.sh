#!/bin/bash

# For this script to run properly, you have to use it in root mode!
# Just type "sudo ./web_server_creator.sh" and you will be fine!

# ============================= Variables section ===============================

# Folders
WEB_SERVER="/var/www/html"
WEB_PAGE_DOWNLOAD="/tmp"



# =========================== Functions section ================================
DownloadApache() {
    apt-get install apache2 -y
}

DownloadUnzip() {
    apt-get install unzip -y
}

UpdateSystem() {
    apt-get update
    apt-get upgrade -y

    DownloadApache
    DownloadUnzip
}

DownloadWebPage() {
    cd $WEB_PAGE_DOWNLOAD
    rm -f main.zip
    wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
    unzip main.zip
}

SetWebServerPage() {
    DownloadWebPage
    cd $WEB_PAGE_DOWNLOAD/linux-site-dio-main
    cp * -R $WEB_SERVER
}



# ============================ Script Section =================================
echo "Updating the system and installing dependencies..."
UpdateSystem

echo "Setting the Web Server Page up..."
SetWebServerPage

echo "Web Server created successfully!"