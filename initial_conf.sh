#!/bin/bash
for item in `ls`
do
	if [[ -f $item ]]
	then
		chmod +x $item
	fi
done
#rm -r initial_conf.sh
