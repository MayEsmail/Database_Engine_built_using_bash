#!/bin/bash
clear
echo " ------------------------------------"
echo "   Available Tables in ourDataBase   "
ls tables
echo "-------------------------------------"
read -p "     Enter Table Name : " TableName
if [[ -f tables/$TableName ]]
then

select var in "Delete Specific Record" "Delete *" "Back"
do
case $var in

"Delete Specific Record")

read -p "      please insert Primary key of the record you want to delete : " PK
sed -i "/$PK/d" tables/$TableName
break 
;;

"Delete *")
sed -i d tables/$TableName
break
;;

"Back")
exit
;;
*)
echo "Worng choice"
;;
esac
done
else 
	echo "please insert table Name vaild "
	sleep 1
	exit
fi
