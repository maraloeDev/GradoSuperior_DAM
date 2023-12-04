#!/bin/bash
IFS=";"
n=1
while read -a columna
do
	echo "equipo $n: "
	echo -e "\tHOSTNAME=${columna[0]}"
	echo -e "\tRAM=${columna[1]}"
	echo -e "\tDISCO=${columna[2]}"
	((n++))
done < equipos.csv
