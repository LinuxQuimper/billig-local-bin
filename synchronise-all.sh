#!/bin/sh

#Ce script va lancer tous les scripts de synchronisation presents dans le repertoire dupdate

#. /usr/local/bin/check-process-once.sh


echo "##########################################################"
echo ""
echo `date +"%Y/%m/%d %H:%M:%S"`
echo "Synchro des releases"
echo ""
echo "##########################################################"

dir_scripts="/mnt/datas/scripts/updaters/releases"

for scriptSync in `ls $dir_scripts/*.sh`
do
    echo "----------------------------------------------------------"
    echo $scriptSync
    echo "Lancement le "`date`
    echo "----------------------------------------------------------"
    bash $scriptSync
    echo "----------------------------------------------------------"
done


echo "##########################################################"
echo ""
echo `date +"%Y/%m/%d %H:%M:%S"`
echo "Synchro des depots"
echo ""
echo "##########################################################"


dir_scripts="/mnt/datas/scripts/updaters/repositories"


for scriptSync in `ls $dir_scripts/*.sh`
do
    echo "----------------------------------------------------------"
    echo $scriptSync
    echo "Lancement le "`date`
    echo "----------------------------------------------------------"
    bash $scriptSync
    echo "----------------------------------------------------------"
    echo "Fin le "`date`
    echo "----------------------------------------------------------"
done



echo "##########################################################"
echo ""
echo `date +"%Y/%m/%d %H:%M:%S"`
echo "Synchro des depots extras"
echo ""
echo "##########################################################"


dir_scripts="/mnt/datas/scripts/updaters/extras"

for scriptSync in `ls $dir_scripts/*.sh`
do
    echo "----------------------------------------------------------"
    echo $scriptSync
    echo "----------------------------------------------------------"
    bash $scriptSync
    echo "----------------------------------------------------------"
done

echo "Fin a "`date +"%Y/%m/%d %H:%M:%S"`

rm $LOCKSYNC

