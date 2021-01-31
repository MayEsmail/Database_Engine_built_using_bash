#!/bin/bash
function draw_screen(){
	echo "****************************************************************"
	echo "                Welcome to $1 Database Main Menu                "
	echo "****************************************************************"
	echo "Enter the number corresponding to your Choise"
}
function draw_options(){
	echo "1) Create Table"
	echo "2) Show all Tables"
	echo "3) Remove Table"
	echo "4) Insert Into Table"
	echo "5) Select from Table"
	echo "6) Delete from Table"
	echo "7) Update Table"
	echo "8) Change Database's Password"
	echo "9) Exit Database"
}
clear;
draw_screen $1
COLUMNS=0
select option in "Create Table" "Show all Tables" "Remove Table" "Insert Into Table" "Select from Table" "Delete from Table" "Update Table" "Change Database's Password" "Exit Database"
do
	case $REPLY in
		1 ) #Create table file in /tables
		     ../.././table_create.sh
		    clear;
		    draw_screen $1	
		    draw_options	
			;;
		2 ) echo "Available tables are: "
		    ls -1 -I "*.meta" tables
			;;
		3 ) read -p "Enter Name of table to be removed: " table_name
		    ../.././Remove_Table.sh $table_name
			clear;
			draw_screen $1
			draw_options
			;;
		4 ) #insert into Table file (validate existance first)
		   ../.././insertTable.sh
			;;
		5 ) ../.././Select.sh
		    draw_screen $1
		    draw_options
			;;
		6 ) #Delete from Table (validate existance first)
			../.././deleteFrom.sh
			;;
		7 )#update table
		     ../.././update_table.sh	
			;;
		8 ) read -sp "Enter the new password: " pass
		    echo $pass > .password
		    echo -e "\n####### Password Changed Successfully ########"
		    	clear;
			draw_screen $1
			draw_options
			;;
		9 ) echo -e "\n                      ####### Logging Out #######" 
		    sleep 1
		    exit
			;;
esac
done
