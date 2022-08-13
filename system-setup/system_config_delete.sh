#!/bin/bash

# For this script to run properly, please execute it with root privilegies.
# Just use "sudo ./system_config_delete.sh"



# ============================= Variables section ===============================

# Folders
PUBLIC="publico/"
ADM="adm/"
SALES="ven/"
SEC="sec/"

# Goups
ADM_GROUP="GRP_ADM"
SALES_GROUP="GRP_VEN"
SEC_GROUP="GRP_SEC"



# ================================= Functions section =================================
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



# ============================ Script Section =================================
cd /home

echo "Removing every user, folder and group created by the previous script..."
ClearFolders
ClearGroups
ClearUsers