#!/bin/bash

# For this script to run properly, you have to use it in root mode!
# Just type "sudo ./system_setup.sh" and you will be fine!

# ============================= Variables section ===============================

# Folders
PUBLIC="publico/"
ADM="adm/"
SALES="ven/"
SEC="sec/"

# Grouping folders
FOLDERS="$PUBLIC $ADM $SALES $SEC"
PRINT_FOLDERS="\"$PUBLIC\", \"$ADM\", \"$SALES\" and \"$SEC\""


# ============================ Script Section =================================
cd /home

echo "Removing the $PRINT_FOLDERS directories, in case they already exist..."

rm -r -f $PUBLIC
rm -r -f $ADM
rm -r -f $SALES
rm -r -f $SEC

echo "Creating the $PRINT_FOLDERS directories..."

sudo mkdir $FOLDERS