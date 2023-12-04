#!/bin/bash
clear
echo adivina un número del 1 al 100
s=$(($RANDOM%100+1))
#read -s -n1 -p "pulsa una tecla para continuar"; echo
np=1
acierto="N"
until [ $np -gt 6 ]
do
	read -p "Propuesta $np: " n
	if [ $n -eq $s ]; then
		acierto="S"
		break
	elif [ $s -lt $n ];then
		echo "es menor que $n"
	else 
		echo "es mayor que $n"
	fi
	((np++))
done
if [ $acierto = "S" ]; then
	echo "qué suerte..."
else
	echo "demasiados intentos, era el $s"
fi
