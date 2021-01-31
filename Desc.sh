#!/bin/bash
cd tables;
if [[ -f $1 ]]
then
	echo "============================================="
	echo " Column_name    Data Type      IS_PK?"
	echo "============================================="
	awk -F: '{printf("%11s",$1);printf("%11s",$2);if($3 != "")printf("           YES");printf("\n");}' "$1.meta"
else
	echo "####### Table $1 Not Found, Check the name #######"
fi
