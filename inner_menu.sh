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
	echo "8) Describe Table"
	echo "9) Change Database's Password"
	echo "10) Exit Database"
}
clear;
draw_screen $1
COLUMNS=0
select option in "Create Table" "Show all Tables" "Remove Table" "Insert Into Table" "Select from Table" "Delete from Table" "Update Table" "Describe Table" "Change Database's Password" "Exit Database"
do
	case $REPLY in
		1 ) 
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
		4 ) read -p "Enter Name of table to insert into it: " table_name
		   ../.././insertTable.sh $table_name
		    clear;
		    draw_screen $1	
		    draw_options			
			;;
		5 ) ../.././Select.sh
		    draw_screen $1
		    draw_options
			;;
		6 ) #Delete from Table (validate existance first)
			../.././deleteFrom.sh
		    clear;
		    draw_screen $1	
		    draw_options
			;;
		7 )#update table
		     ../.././update_table.sh
		   clear;
		   draw_screen $1	
		   draw_options
			;;
		8 ) read -p "Enter Name of table to be described " table_name
		   ../.././Desc.sh $table_name
			;;
		9 ) read -sp "Enter the new password: " pass
		    echo $pass > .password
		    echo -e "\n####### Password Changed Successfully ########"
		    	clear;
			draw_screen $1
			draw_options
			;;
		10 ) echo -e "\n                      ####### Logging Out #######" 
		    sleep 1
		    exit
			;;
		* ) echo "####### Invalid OPtion, Enter a Number in range 1...10 #######"
esac
done
