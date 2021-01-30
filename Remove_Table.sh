#!/bin/bash
if [[ -f "tables/$1" ]]
then
	rm -r "tables/$1";
	echo "####### Table Removed #######"
else
	echo "####### Table $1 Not Found, Check the name #######"
fi
