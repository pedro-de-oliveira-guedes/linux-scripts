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

# Goups
ADM_GROUP="GRP_ADM"
SALES_GROUP="GRP_VEN"
SEC_GROUP="GRP_SEC"

# Password
STANDARD_PASSWORD="Senha123"


# ============================ Script Section =================================
cd /home


echo "Removing the $PRINT_FOLDERS directories, in case they already exist..."
rm -r -f $PUBLIC
rm -r -f $ADM
rm -r -f $SALES
rm -r -f $SEC


echo "Creating the $PRINT_FOLDERS directories..."
sudo mkdir $FOLDERS


echo "Creating the groups..."
groupadd $ADM_GROUP
groupadd $SALES_GROUP
groupadd $SEC_GROUP


echo "Making the root user own every non public folder created..."
chown root:$ADM_GROUP $ADM
chown root:$SALES_GROUP $SALES
chown root:$SEC_GROUP $SEC


echo "Granting the right permissions to every folder created..."
chmod 777 $PUBLIC
chmod 770 $ADM
chmod 770 $SALES
chmod 770 $SEC


echo "Creating the system users..."

echo "ADM employees..."
useradd carlos -c "" -G $ADM_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
chsh -s /bin/bash carlos
passwd carlos -e

useradd maria -c "" -G $ADM_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
chsh -s /bin/bash maria
passwd maria -e

useradd joao_ -c "" -G $ADM_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
chsh -s /bin/bash joao_
passwd joao_ -e


echo "SALES employees..."
useradd debora -c "" -G $SALES_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
chsh -s /bin/bash debora
passwd debora -e

useradd sebastiana -c "" -G $SALES_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
chsh -s /bin/bash sebastiana
passwd sebastiana -e

useradd roberto -c "" -G $SALES_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
chsh -s /bin/bash roberto
passwd roberto -e


echo "SEC employees..."
useradd josefina -c "" -G $SEC_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
chsh -s /bin/bash josefina
passwd josefina -e

useradd amanda -c "" -G $SEC_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
chsh -s /bin/bash amanda
passwd amanda -e

useradd rogerio -c "" -G $SEC_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
chsh -s /bin/bash rogerio
passwd rogerio -e
