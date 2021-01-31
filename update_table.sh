!/bin/bash
clear
echo " ------------------------------------"
echo "   Available Tables in ourDataBase   "
ls tables
echo "-------------------------------------"
read -p "Enter table Name: " tableName
if [[ -f tables/$tableName ]]
then
read -p "      please insert Primary key of the record you want to update it's Data : " PK
line=`awk -F: '{print $0}' tables/$tableName`
sed -i "/$PK/d" tables/$tableName
number_row=`awk 'END { print NR }' tables/$tableName.meta`
for(( i=0 ; i<$number_row ; i++ ))
do
	read -p "     Enter The New Data Of The $i Coulumn : " data
	if [[ $i = 0 ]]
        then
        typeset -i x=0
                for var in `awk -F: '{print $1}' tables/$tableName`
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
                         ../.././update_table.sh
                fi

        fi

AppendedLine+="${data}:"
done
echo "${AppendedLine}">> tables/$tableName
echo "----------------------------------------------"
echo "             *** updated Successfully *** "
echo "----------------------------------------------"


else
        echo "please insert table Name vaild "
        sleep 1
        ./update_table.sh

fi
