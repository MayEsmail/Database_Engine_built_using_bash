cd tables;
clear;
echo "******************************************"
echo "           Show data from Table           "
echo -e "******************************************\n"

read -p "Enter the name of the table : " table_name
if [[ -f $table_name ]]
then
	select x in "Select * from $table_name" "Select by primary key" "do Aggregate function on column" "Specify Columns and Condition" "Back"
	do
		case $REPLY in
			1 )
				awk '{printf "============";} END{printf "\n"}' "$table_name.meta"
				awk -F: '{printf("%10s",$1)}' "$table_name.meta"
				awk 'BEGIN{printf "\n"} {printf "============";} END{printf "\n"}' "$table_name.meta"
				awk -F: '{ for(i=1;i<=NF;i++)printf("%10s",$i); printf "\n";} ' "$table_name"
				break
				;;
			2 )
				echo -n "select * from $table_name where ";
				awk -F: '{printf $1; exit}' "$table_name.meta";
				read -p " = " prim;
				awk '{printf "============";} END{printf "\n"}' "$table_name.meta";
				awk -F: '{printf("%10s",$1)}' "$table_name.meta";
				awk 'BEGIN{printf "\n"} {printf "============";} END{printf "\n"}' "$table_name.meta";
				awk -F: -v p=$prim '{ if($1 == p){for(i=1;i<=NF;i++)printf("%10s",$i); printf "\n"; exit}} ' "$table_name"
				break
				;;
			3 )	../../.././Aggregate_Func.sh $table_name;;
			4 )	../../.././Select_cols_conds.sh $table_name;;
			5 )	exit; ;;					
		esac
	done
else
	echo "####### Table $1 Not Found, Check the name #######"
	sleep 1.5
fi
