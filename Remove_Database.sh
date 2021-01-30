#!/bin/bash
typeset -i name_exist=0
for db in Databases/*
do
	if [ Databases/$1 = $db ]
	then
		(( name_exist=1 ))
		if [ $(<"$db"/password) = $2 ]
		then
			rm -r $db;
			echo -e "\n####### Database Removed #######"
		else
			echo -e "\n####### Wrong Password #######"
		fi
		break
	fi
done
if [ $name_exist -eq 0 ]
then
	echo -e "\n####### Database $1 Not Found, Check the name #######"
fi
