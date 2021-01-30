#!/bin/bash
typeset -i valid_name=1
for db in Databases/*
do
	if [ Databases/$1 = $db ]
	then
		(( valid_name = 0 ))
		echo -e "\n####### The Name of Database already exists! ########"
		break
	fi
done
if [ $valid_name -ne 0 ]
then
	mkdir Databases/$1
	mkdir Databases/$1/tables
	touch Databases/$1/.password
	echo "$2" >> Databases/$1/.password
	echo -e "\n####### Database Created Successfully, Name: $1, Secured #######"
fi
