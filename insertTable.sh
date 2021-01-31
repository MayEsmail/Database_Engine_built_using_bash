#!/bin/bash
clear;
cd tables
shopt -s extglob
shopt -s globasciiranges
typeset -i index=0
typeset -i correctness_flag=0
if [[ -f $1 ]]
then
mycols=($(awk -F: '{ print $1 }' "$1.meta"))
cols_datatypes=($(awk -F: '{ print $2 }' "$1.meta"))
len=${#mycols[@]}
while [ $correctness_flag -eq 0 ]
do
	(( correctness_flag = 1 ))
	read -p "## Enter Value Of ${mycols[0]}: " pk
	if [ -z "$pk" ]
	then
		(( correctness_flag = 0 ))
		echo "####### Value of ${mycols[0]} Cannot Be NULL, Try Again. #######"
		continue
	fi
	if [[ "$pk" = *:* ]]
	then
		(( correctness_flag = 0 ))
		echo "Sorry, you can't use colons"
		continue
	fi
	if [ ${cols_datatypes[0]} = "int" ]
	then
		case $pk in 
		+([0-9])) ;;
		*) 
			(( correctness_flag = 0 ))
			echo "####### Error, $pk is not an integer #######"
			continue
			;;
		esac	
	fi
	for field in $(cut -f1 -d: "$1")
	do
		if [ $field = "$pk" ] 
		then
			(( correctness_flag = 0 ))
			break
		fi
	done
	if [ $correctness_flag -eq 0 ]
	then
		echo "####### $1 with Primary_key $pk already exists #######"
	fi
	AppendedLine+="$pk:"
done

for i in "${mycols[@]}"
do	
	if [ $index -eq 0 ]
	then
		(( index++ ))
		continue
	fi
	read -p "##Enter the ${mycols[$index]} : " data
	(( correctness_flag = 0 ))	
	while [ $correctness_flag -eq 0 ]
	do
		(( correctness_flag = 1 ))
		if [ ${cols_datatypes[$index]} = "int" ]
		then
			case $data in 
			+([0-9]))
				;;
			*) 
				(( correctness_flag = 0 ))
				echo "####### Error, $data is not an integer #######"
				continue
				;;
		esac	
		fi
	done
	(( index++ ))
	if (( index == len ))
	then	
		AppendedLine+="$data";
	else
		AppendedLine+="$data:"
	fi
done

echo "${AppendedLine}">> $1
echo "####### New $1 instance has been added successfully #######"
sleep 1
else
	echo "####### Table $1 Not Found! #######"
        sleep 1.5
        exit
fi
