#!/bin/bash
typeset -i name_exist=0
for db in Databases/*
do
	if [ Databases/$1 = $db ]
	then
		(( name_exist=1 ))
		if [ $(<"$db"/.password) = $2 ]
		then
			clear;
			cd $db
			pwd;
			../.././inner_menu.sh $1
		else
			echo -e "\n####### Wrong Password #######"
			sleep 2
		fi
		break
	fi
done
if [ $name_exist -eq 0 ]
then
	echo -e "\n####### Database $1 Not Found, Check the name #######"
	sleep 1
fi
