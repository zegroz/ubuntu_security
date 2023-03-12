#!/bin/bash
HOSTNAME=HOST_NAME
LOGFILE=/home/user/path/firewall.log
CurrentIP=$(host $HOSTNAME | head -n1 | cut -f4 -d ' ')

if [ ! -f $LOGFILE ]; then
    /usr/sbin/ufw allow from $CurrentIP to any port 80 
    /usr/sbin/ufw allow from $CurrentIP to any port 443
    #/usr/sbin/ufw allow from $CurrentIP to  "Nginx HTTPS"
    echo $CurrentIP > $LOGFILE
else
    LastIP=$(cat $LOGFILE)
    if [ "$CurrentIP" = "$LastIP" ] ; then
        echo IP address has not changed
    else
        /usr/sbin/ufw delete allow from $LastIP to any port 80 
        /usr/sbin/ufw delete allow from $LastIP to any port 443
        /usr/sbin/ufw allow from $CurrentIP to any port 80  
        /usr/sbin/ufw allow from $CurrentIP to any port 443
        echo $CurrentIP > $LOGFILE
        echo iptables have been updated
    fi
fi
