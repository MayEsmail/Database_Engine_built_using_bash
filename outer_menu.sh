#!/bin/bash
function draw_screen(){
clear;
echo "***************************************************************"
echo "**             Welcome to DBMS - Bash Shell based            **"
echo "**        Developed by: Aalaa Muhammad and May Esmail        **"
echo "** Description:In our DBMS you can perform basic DB commands **"
echo "***************************************************************"
echo "Enter the number of your Choise"
}
draw_screen
COLUMNS=0
select option in "Create Database" "Use Database" "Show all Databases" "Remove Database" "Exit Engine"
do
	case $REPLY in
		1 ) read -p "Enter Name of New DataBase: " db_name
		    read -sp "Enter Password for the New Database: " password
		    ./Create_Database.sh $db_name $password
			;;
		2 ) read -p "Enter Name of Database you wanna use: " db_name
		    read -sp "Enter the Password: " password
		    ./Use_Database.sh $db_name $password
		    draw_screen
		    echo "1) Create Database"
		    echo "2) Use Database"
		    echo "3) Show all Databases"
		    echo "4) Remove Database"
		    echo "5) Exit Engine"
			;;
		3 ) echo "Available Databases Are: " 
		    ls -1 Databases                 #ls -1 prints in 1 column
			;;
		4 ) read -p "Enter Name of Database to be removed: " db_name 
		    read -sp "Enter the Password: " password
		    ./Remove_Database.sh $db_name $password
			;;
		5 ) echo "Bye!"
		    exit ;;
		* ) echo "Invalid Option .. Please Enter number in range 1 to 5" ;;
esac
done
