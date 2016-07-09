#!/bin/bash
export TERM=xterm

if [ -z "`ls /etc/apache2/sites-available`" ] 
then
	cp -R /etc-start/apache2/sites-available/* /etc/apache2/sites-available
fi

if [ -z "`ls /etc/apache2/sites-enabled`" ] 
then
	cp -R /etc-start/apache2/sites-enabled/* /etc/apache2/sites-enabled
fi

if [ -z "`ls /etc/php5`" ] 
then
	cp -R /etc-start/php5/* /etc/php5
fi

# Start apache
/usr/sbin/apache2 -D FOREGROUND
