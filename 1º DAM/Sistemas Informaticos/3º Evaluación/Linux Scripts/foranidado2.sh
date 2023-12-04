#!/bin/bash
#foranidado2.sh
n=1
for (( i=1; i<=$1; i++ ))
do
	for (( j=1; j<=$2; j++ ))
	do
		echo -n -e "$((n++))\t"
	done
	echo
done
