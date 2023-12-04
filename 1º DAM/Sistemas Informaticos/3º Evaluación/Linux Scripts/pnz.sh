#!/bin/bash
# pnz.sh param -> comprueba si un número es + - o cero
if [ $1 -gt 0 ]; then
	echo "$1 es positivo"
elif [ $1 -lt 0 ]; then
	echo "$1 es negativo"
elif [ $1 -eq 0 ]; then
	echo "es cero"
else
	echo "vaya!, $1 no es un número"
fi 2>/dev/null
