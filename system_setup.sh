#!/bin/bash
echo "For this script to run properly, you need to grant root privilegies"
su

# Variables section
PUBLIC="publico/"
ADM="adm/"
SALES="ven/"
SEC="sec/"

FOLDERS="$PUBLIC $ADM $SALES $SEC"
PRINT_FOLDERS="\"$PUBLIC\", \"$ADM\", \"$VEN\" and \"$SEC\""

cd /home

echo "Removing the $PRINT_FOLDERS directories, in case they already exist..."

rm -r -f $PUBLIC
rm -r -f $ADM
rm -r -f $VEN
rm -r -f $SEC

echo "Creating the $PRINT_FOLDERS directories..."

sudo mkdir $FOLDERS