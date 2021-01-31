#!/bin/bash
clear
echo " ------------------------------------"
echo "   Available Tables in ourDataBase   "
ls tables
echo "-------------------------------------"
read -p "Enter table Name: " insertb
if [[ -f tables/$insertb ]]
then
typeset  number_row=`awk 'END { print NR }' tables/$insertb".meta";`
pk=`awk -F: '{print $1}' tables/$insertb`
dt=`awk -F: '{print $2}' tables/$insertb.meta`
#echo $dt
for(( i=0 ; i<$number_row ; i++ ))
do
	read -p "     Enter Data Of The $i Coulumn : " data
	if [[ $i = 0 ]]
	then 
	typeset -i x=0
		for var in `awk -F: '{print $1}' tables/$insertb`
			do 
				if [[ $var = $data ]]
				then
				let x=1
				break
				fi
			done
	

		if [[ $x = 0 ]]
			then
			echo "*****Primary key is correct*******"
			let x=1
		else
			echo "*****Duplicated Primary key********"
			sleep 1
			 ../.././insertTable.sh
		fi

	fi
AppendedLine+="${data}:"
done
echo "${AppendedLine}">> tables/$insertb
echo "----------------------------------------------"
echo "             *** Add New Row Successfully *** "
echo "----------------------------------------------"

select var in "Insert Another Record" "Back"
do
case $var in
"Insert Another Record")
	../.././insertTable.sh
;;

"Back")
../.././inner_menu.sh
;;

*)
echo "Wrong choice"
;;
esac
done
else
	 echo "please insert table Name vaild "
        sleep 1
        ../.././insertTable.sh

fi
