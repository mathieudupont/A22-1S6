#!/bin/bash

turbstatus=$(cat /etc/turbined.conf)
if [[ "$turbstatus" = "STATUS=ON" ]]
then
        cat /var/www/html/turbine.log | grep ON | tail -5 >> /media/sauvegarde/turbine-stat.log
        logline=$(cat /media/sauvegarde/turbine-stat.log | wc -l)
        if [ $logline -gt 10000 ]
        then
                datejour=$(date +%Y%m%d)
                mv /media/sauvegarde/turbine-stat.log /media/sauvegarde/turbine-stat-$datejour.log
                gzip /media/sauvegarde/turbine-stat-$datejour.log
        fi
fi
