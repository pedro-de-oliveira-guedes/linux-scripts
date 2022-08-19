#!/bin/bash

# For this script to run properly, you have to use it in root mode!
# Just type "sudo ./web_server_creator.sh" and you will be fine!

# ============================= Variables section ===============================

# Folders
WEB_SERVER="/etc/www/html/"
WEB_PAGE_DOWNLOAD="/tmp/"



# =========================== Functions section ================================
DownloadApache() {
    apt install apache2 -y
}

DownloadUnzip() {
    apt install unzip -y
}

UpdateSystem() {
    apt update
    apt upgrade -y

    DownloadApache
    DownloadUnzip
}

DownloadWebPage() {
    cd WEB_PAGE_DOWNLOAD
    wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
    unzip main.zip
}

SetWebServerPage() {
    DownloadWebPage
    cd linux-site-dio-main/
    cp * WEB_SERVER
}



# ============================ Script Section =================================
echo "Updating the system and installing dependencies..."
UpdateSystem

echo "Setting the Web Server Page up..."
SetWebServerPage

echo "Web Server created successfully!"