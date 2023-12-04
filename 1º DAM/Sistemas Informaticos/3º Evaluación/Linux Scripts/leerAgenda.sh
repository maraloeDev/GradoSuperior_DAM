#!/bin/bash
IFS=","
n=1
while read -a columna
do
	echo "Cliente $n: "
	echo -e "\tNombre completo= ${columna[1]}, ${columna[0]}"
	echo -e "\tTeléfono= ${columna[2]}"
	((n++))
done < agenda.csv
