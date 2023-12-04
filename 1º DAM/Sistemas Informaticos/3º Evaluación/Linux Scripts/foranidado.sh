#!/bin/bash
for (( i=1; i <= 6; i++ ))
do
	for (( j=1; j<=8; j++ ))
	do
		echo -n -e "$(( j+8*(i-1) ))\t"
	done
	echo
done
