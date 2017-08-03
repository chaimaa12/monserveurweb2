#!/bin/bash
if [ -z $1 ]
then
	echo "veuillez entrer un nom utilisateur"
	exit 2
fi
if [ -z $2 ]
then
	echo "veuillez entrer un mot de pass"
	exit 2
fi
serverUserInfo=`cat /etc/shadow | grep $1 | cut -d '/' -f2`
salt=`cat /etc/shadow | grep $1 | cut -d '$' -f3`
clientUserInfo=`mkpasswd -m sha-512 $2 -s $salt | cut -d '/' -f2`

if [ $serverUserInfo != $clientUserInfo ]
then
	echo "invalid"
else 
	echo "ok"
fi
exit 0