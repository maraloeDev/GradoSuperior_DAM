#!/bin/bash
IFS=";"
n=1
while read hostname ram hdd
do
	echo "equipo $n: "
	echo -e "\tHOSTNAME=$hostname"
	echo -e "\tRAM=$ram"
	echo -e "\tDISCO=$hdd"
	((n++))
done < equipos.csv
