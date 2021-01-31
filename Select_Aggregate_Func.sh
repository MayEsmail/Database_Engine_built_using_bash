#!/bin/bash
typeset -i flag=0
typeset -i index=0
function draw_screen(){
echo "1)SUM"
echo "2)AVG"
echo "3)COUNT"
echo "4)LCASE"
echo "5)UCASE"
echo "6)Back"
} 
mycols=($(awk -F: '{ print $1 }' "$1.meta"))
mycols_types=($(awk -F: '{ print $2 }' "$1.meta"))
for i in "${mycols[@]}"
do
	if [ $i = $2 ]
	then
		(( flag = 1 ))
		break
	fi
	(( index++ ))
done
if [ $flag -eq 0 ]
then
	echo "####### Table $1 has no column with name $2 #######"
	sleep 1.5
	exit
fi
COLUMNS=0;
select x in "SUM" "AVG" "COUNT" "LCASE" "UCASE" "Back"
do
	case $REPLY in
	1 )
		if [ ${mycols_types[$index]} = "int" ]
		then
			echo "==============="
			echo "    SUM($2)"
			echo "==============="
			echo -n "      "
			(( index++ ))
			awk -F: -v idx=$index '{sum+=$idx;}END{print sum;}' $1
			(( index-- ))	
		else
			echo "####### Can't Sum Column of String Datatype #######"
		fi
		draw_screen
		;;
	2 ) 
		if [ ${mycols_types[$index]} = "int" ]
		then
			echo "==============="
			echo "    AVG($2)"
			echo "==============="
			echo -n "   "
			(( index++ ))
			awk -F: -v idx=$index '{sum+=$idx; i++;}END{printf("%f\n",sum/i);}' $1
			(( index-- ))
		else
			echo "####### Can't Sum Column of String Datatype #######"
		fi
		draw_screen
		;;
	3 ) 
		echo "==============="
		echo "   COUNT($2)"
		echo "==============="
		echo -n "      "
		(( index++ ))
		awk -F: -v idx=$index '{if($idx != "")cnt++;}END{print cnt;}' $1
		(( index-- ))
		draw_screen
		;;
	4 ) 
		if [ ${mycols_types[$index]} = "string" ]
		then
			echo "==============="
			echo "   LCASE($2)"
			echo "==============="
			(( index++ ))
			awk -F: -v idx=$index '{printf("%9s\n",tolower($idx))}' $1
			(( index-- ))
		else
			echo "####### Can't Find Lowercase of Integer Datatype #######"
		fi
		draw_screen	
		;;
	5 ) 
		if [ ${mycols_types[$index]} = "string" ]
		then
			echo "==============="
			echo "   UCASE($2)"
			echo "==============="
			(( index++ ))
			awk -F: -v idx=$index '{printf("%9s\n",toupper($idx))}' $1
			(( index-- ))
		else
			echo "####### Can't Find Uppercase of Integer Datatype #######"
		fi
		draw_screen		
		;;
	6 ) exit ;;
	* ) echo "Invalid option, please choose a number in range 1..6";;
	esac
done
