#!/bin/bash
clear
echo piensa un número del 1 al 100
read -s -n1 -p "pulsa una tecla para continuar"; echo
min=1
max=101
while true
do
	n=$(((min+max)/2))
	read -n1 -p "¿es el $n? (>,<,=): " resp
	echo
	case $resp in 
	">")
		min=$n ;;
	"<")
		max=$n ;;
	"=")
		echo "OEeeee OE OE OEeee!"
		break ;; # break sale del bucle
	*)
		echo "no computable..." ;;
	esac
done
