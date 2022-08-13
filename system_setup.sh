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



# =========================== Functions section ================================
ClearFolders () {
    rm -r -f $PUBLIC
    rm -r -f $ADM
    rm -r -f $SALES
    rm -r -f $SEC
}

ClearGroups () {
    groupdel $ADM_GROUP
    groupdel $SALES_GROUP
    groupdel $SEC_GROUP
}

ClearUsers() {
    userdel -r -f carlos
    userdel -r -f maria
    userdel -r -f joao_

    userdel -r -f debora
    userdel -r -f sebastiana
    userdel -r -f roberto

    userdel -r -f josefina
    userdel -r -f amanda
    userdel -r -f rogerio
}

CreateFolders () {
    sudo mkdir $FOLDERS
}

CreateGroups () {
    groupadd $ADM_GROUP
    groupadd $SALES_GROUP
    groupadd $SEC_GROUP
}

MakeRootOwnFolders () {
    chown root:$ADM_GROUP $ADM
    chown root:$SALES_GROUP $SALES
    chown root:$SEC_GROUP $SEC
}

GrantFoldersPermissions () {
    chmod 777 $PUBLIC
    chmod 770 $ADM
    chmod 770 $SALES
    chmod 770 $SEC
}

CreateAdmEmployeesUsers () {
    useradd carlos -c "ADM employee" -G $ADM_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
    chsh -s /bin/bash carlos
    passwd carlos -e

    useradd maria -c "ADM employee" -G $ADM_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
    chsh -s /bin/bash maria
    passwd maria -e

    useradd joao_ -c "ADM employee" -G $ADM_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
    chsh -s /bin/bash joao_
    passwd joao_ -e
}

CreateSalesEmployeesUsers () {
    useradd debora -c "SALES employee" -G $SALES_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
    chsh -s /bin/bash debora
    passwd debora -e

    useradd sebastiana -c "SALES employee" -G $SALES_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
    chsh -s /bin/bash sebastiana
    passwd sebastiana -e

    useradd roberto -c "SALES employee" -G $SALES_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
    chsh -s /bin/bash roberto
    passwd roberto -e
}

CreateSecEmployeesUsers () {
    useradd josefina -c "SEC employee" -G $SEC_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
    chsh -s /bin/bash josefina
    passwd josefina -e

    useradd amanda -c "SEC employee" -G $SEC_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
    chsh -s /bin/bash amanda
    passwd amanda -e

    useradd rogerio -c "SEC employee" -G $SEC_GROUP -p $(openssl passwd $STANDARD_PASSWORD)
    chsh -s /bin/bash rogerio
    passwd rogerio -e
}



# ============================ Script Section =================================
cd /home


echo "Removing the $PRINT_FOLDERS directories, in case they already exist..."
ClearFolders


echo "Removing the groups in case they already exist..."
ClearGroups


echo "Removing the users, in case they already exist..."
ClearUsers


echo "Creating the $PRINT_FOLDERS directories..."
CreateFolders


echo "Creating the groups..."
CreateGroups


echo "Making the root user own every non public folder created..."
MakeRootOwnFolders


echo "Granting the right permissions to every folder created..."
GrantFoldersPermissions


echo "Creating the system users..."

echo "ADM employees..."
CreateAdmEmployeesUsers


echo "SALES employees..."
CreateSalesEmployeesUsers


echo "SEC employees..."
CreateSecEmployeesUsers
