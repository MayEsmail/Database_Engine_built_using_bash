#!/bin/bash
clear;
echo "****************************************************************"
echo "                Welcome to $1 Database Main Menu                "
echo "****************************************************************"
echo "Enter the number corresponding to your Choise"
COLUMNS=0
select option in "Create Table" "Show all Tables" "Remove Table" "Insert Into Table" "Select from Table" "Delete from Table" "Update Table" "Change Database's Password" "Exit Database"
do
	case $REPLY in
		1 ) #Create table file in /tables
		     ../.././table_create.sh
			;;
		2 ) echo "Available tables are: "
		    ls  tables
		   #find tables -not -name "*meta"  
			;;
		3 ) read -p "Enter Name of table to be removed: " table_name
		    ../.././Remove_Table.sh $table_name
			;;
		4 ) #insert into Table file (validate existance first)
		   ../.././insertTable.sh
			;;
		5 ) #Select from Table (validate existance first)
			;;
		6 ) #Delete from Table (validate existance first)
			../.././deleteFrom.sh
			;;
		7 ) #Update table (validate existance first)
			;;
		8 ) read -sp "Enter the new password: " pass
		    echo $pass > .password
		    echo -e "\n####### Password Changed Successfully ########"
			;;
		9 ) echo -e "\n                      ####### Logging Out #######" 
		    sleep 1
		    exit
			;;
esac
done
