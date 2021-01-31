#!/bin/bash
typeset -i pk_selected=0
typeset -i change=0
clear;
echo "********************************************"
echo "             create new table               "
echo "********************************************"
read -p "Enter Table Name : " tbname
if [[ -f tables/$tbname ]]
then	
	echo "####### Table $tbname already exists #######"
	sleep 1.5;
else
	touch tables/$tbname".meta"
	touch tables/$tbname
read -p "Enter Number of columns : " n
for (( i = 1; i <= n; i++ ))
do
	(( change = 0 ))
	read -p "Enter column $i name : " name;
	echo -n $name":" >> mystr;
	echo "Select the data type of $name"
	select x in "Int" "String"
	do
		case $REPLY in
			1 ) echo -n "int" >> mystr;
    				break ;;
			2 ) echo -n "string" >> mystr;
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
				1 ) echo -n ":pk" >> mystr;
    				pk_selected=1;
				change=1;
    				break ;;
				2 ) break ;;
				* ) echo "Invalid Choise .. Try Again, Enter the number corresponding to your choise" ;;
			esac
		done
	fi
	echo "" >> mystr
	if [ $change -eq 1 ]
	then
		cp tables/$tbname".meta" tmp
		rm tables/$tbname".meta"
		cat mystr > tables/$tbname".meta"
		cat tmp >> tables/$tbname".meta"
		rm -r mystr tmp;
	else
		cat mystr >> tables/$tbname".meta"
		rm mystr
	fi
	(( change = 0 ))
done
echo "          ####### Table $tbname has been created successfully ########"
sleep 1.5
fi
