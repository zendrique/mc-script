# Backup
echo "Voulez-vous crée une sauvegarde automatique de votre serveur une fois par jour ?"
select backup in "Oui" "Non"; do
    case $backup in
        Oui ) 
        echo "crontab 00 22 * * * /home/"$dossier"/backup.sh" >> /etc/crontab
        cd /home/$dossier
        touch backup.sh
        
        echo "TEMP="$dossier"/temp" >> backup.sh
        echo "BACKUP="$dossier"/backup" >> backup.sh

        echo "screen -S "$dossier" -X stuff "say Sauvegarde du monde dans 10 secondes."`echo -ne '\015'`" >> backup.sh
        echo "sleep 10" >> backup.sh

        echo "screen -S "$dossier" -p world -X stuff "say Sauvegarde du monde..."`echo -ne '\015'`" >> backup.sh
        echo "screen -S "$dossier" -p world -X stuff "save-off"`echo -ne '\015'`" >> backup.sh
        echo "screen -S "$dossier" -p world -X stuff "save-all"`echo -ne '\015'`" >> backup.sh
        echo "sleep 20" >> backup.sh
        
        echo "THEDATE=`date +%Y%m%d-%H%M`" >> backup.sh
        echo "`date +"%F %H:%M:%S"`" Starting Copy >> backup.sh
        echo "cp -a $WORLD $TEMP/world" >> backup.sh
        echo "cp -r $MCDIR/plugins $TEMP/plugins" >> backup.sh
        echo "cp $MCDIR/*.properties $TEMP/." >> backup.sh
        echo "cp $MCDIR/*.txt $TEMP/." >> backup.sh
        echo "echo `date +"%F %H:%M:%S"` Done with Copy" >> backup.sh

        echo "screen -S "$dossier" -p world -X stuff "save-on"`echo -ne '\015'`" >> backup.sh
        
        echo "cd" $TEMP >> backup.sh
        echo "nice -n "$PRI" zip -r world-THEDATE.zip "$BACKUP"/hourly" >> backup.sh
        echo "if [ `date +%k` == 0 ] ; then" >> backup.sh
            echo "cp "$TEMP"/world-"$THEDATE".zip "$BACKUP"/daily" >> backup.sh

             echo "if [ `date +%w` == 0 ] ; then" >> backup.sh
                echo "cp "$TEMP"/world-"$THEDATE".zip "$BACKUP"/weekly" >> backup.sh
             echo "fi" >> backup.sh

             echo "if [ `date +%-d` == 1 ] ; then" >> backup.sh
                echo "cp" $TEMP"/world-"$THEDATE".zip "$BACKUP"/monthly" >> backup.sh
             echo "fi" >> backup.sh

        echo "fi" >> backup.sh

        echo "rm -rf" $TEMP"/world/" >> backup.sh
        echo "rm -rf" $TEMP"/plugins/" >> backup.sh
        echo "rm" $TEMP"/world-"$THEDATE".zip" >> backup.sh
        echo "find" $BACKUP"/hourly -type f -mtime +2 -exec rm -f '{}' \;" >> backup.sh
        echo "if [ `date +%k` == 0 ] ; then" >> backup.sh
            echot "find "$BACKUP"/daily -type f -mtime +7 -exec rm -f '{}' \;" >> backup.sh
            echo "if [ `date +%w` == 0 ] ; then" >> backup.sh
            echo "find" $BACKUP"/weekly -type f -mtime +45 -exec rm -f '{}' \;" >> backup.sh
        echo "fi" >> backup.sh
    echo "fi" >> backup.sh
        break;;
        Non ) break;;
        esac
done
