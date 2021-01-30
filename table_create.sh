#!/bin/bash
echo "------------------------------------"
echo " create new table                   "
echo "------------------------------------"
read -p "Enter Table Name : " tbname
#if ! [[ $tbname =~ ^[a-zA-Z]+$ ]];
#then 
#	echo "$tbname is not string value ,please inseart a valid one "	
if [ -f ./$tbname ];
then	
	echo "Table $tbname already exists";
else
touch ./tables/$tbname;
read -p "Enter Number of columns :" n;
for (( i = 1; i <= n; i++ ))
do
read -p "Enter column $i name :" name;
echo -n $name":" >> ./tables/$tbname;
read -p "Enter data type you wnat (int or string) :" columType;
echo -n $columType":" >> ./tables/$tbname;
read -p "(select As primary Key pk/not) :" is_pk;
echo  $is_pk >> ./tables/$tbname;
done
echo "$tbname has been created"
fi
~            
