#!/bin/bash
typeset -i pk_selected=0
clear;
echo "********************************************"
echo "             create new table               "
echo "********************************************"
read -p "Enter Table Name : " tbname
if [[ -f tables/$tbname ]]
then	
	echo "Table $tbname already exists"
else
touch tables/$tbname".meta"
touch tables/$tbname
read -p "Enter Number of columns : " n
for (( i = 1; i <= n; i++ ))
do
read -p "Enter column $i name : " name;
echo -n $name":" >> tables/$tbname".meta"
echo "Select the data type of $name"
select x in "Int" "String"
do
case $REPLY in
1 ) echo -n "int" >> tables/$tbname".meta";
    break ;;
2 ) echo -n "string" >> tables/$tbname".meta";
    break ;;
* ) echo "Invalid Choise .. Try Again, Enter the number corresponding to your choise" ;;
esac
done
if [ $pk_selected -eq 0 ]
then
echo "Do you want to make $name as the primary key?"
select x in "YES" "NO"
do
case $REPLY in
1 ) echo -n ":pk" >> tables/$tbname".meta";
    pk_selected=1;
    break ;;
2 ) break ;;
* ) echo "Invalid Choise .. Try Again, Enter the number corresponding to your choise" ;;
esac
done
fi
echo "" >> tables/$tbname".meta";
done
echo "          ####### Table $tbname has been created successfully ########"
sleep 1
fi
