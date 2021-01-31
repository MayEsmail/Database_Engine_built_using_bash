#!/bin/bash
if [[ -f "tables/$1" ]]
then
	rm -r "tables/$1" "tables/$1.meta";
	echo "####### Table Removed #######"

else
	echo "####### Table $1 Not Found, Check the name #######"
fi
sleep 1.5
