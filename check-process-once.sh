#!/bin/sh
SCRIPTNAME=`basename $0`
export LOCKSYNC="/var/run/$SCRIPTNAME.lock"
PID=$$

echo "["`date +"%Y/%m/%d %H:%M:%S"`"] Demarrage du script $0"


if [ -f "$LOCKSYNC"  ]
then
        echo "Fichier lock "$LOCKSYNC" present. Deja en cours ?"
        PIDLOCK=`cat $LOCKSYNC`
        #echo "Etat du process "$PIDLOCK
        #echo `ps u $PIDLOCK`

        if [ -f /proc/$PIDLOCK/exe ]
        then
                echo "Le process semble etre toujours en cours. Lancement de $SCRIPTNAME impossible."
                exit
        else
                echo "Le process ne semble plus etre en cours, Lancement de $SCRIPTNAME"
                rm $LOCKSYNC
        fi
fi

echo "Creation du lock "$LOCKSYNC
echo $PID > $LOCKSYNC


