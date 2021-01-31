#!/bin/bash
clear
echo " ------------------------------------"
echo "   Available Tables in ourDataBase   "
ls tables
echo "-------------------------------------"
read -p "     Enter Table Name : " TableName
if [[ -f tables/$TableName ]]
then

select var in "Delete Specific Record" "Back"
do
case $var in

"Delete Specific Record")

read -p "      please insert Primary key of the record you want to delete : " PK
sed -i "/$PK/d" tables/$TableName 
;;

"Back")
../.././inner_menu.sh
;;
*)
echo "Worng choice"
;;
esac
done
else 
	echo "please insert table Name vaild "
	sleep 2
	../.././deleteFrom.sh 
fi
