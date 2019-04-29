#!/bin/bash

####
#	Author:		Andreas Walker <a.walker@glaronia.ch>
#	Date:		27-Apr-2019
#	Version:	0.0.1
#	License:	GPL
####

#Initiating Variable
HOST=$1

#Die if host variable is empty
if  [ -z "$HOST" ] 
	then
	echo "UNKNOWN - host not defined"
	exit 3
fi

#Store NMAP-Output as Variable
NMAP=$(nmap -nP -sP $HOST)

#Get Status
STATUS=$(echo "$NMAP" | grep "Host is")

#Return OK if Host is Up. else Critical.
if [[ "$STATUS" == *"up"* ]];
	then
	echo "OK - $HOST: $STATUS"
	exit 0
fi
DOWN=$(echo "$NMAP" | grep "0 hosts up")
if [[ "$DOWN" == *"0 hosts up"* ]]
	then
	echo "CRITICAL - $HOST: $DOWN"
	exit 2
fi
