#!/bin/bash
# tablam.sh número -> muestra la tabla de multiplicar de número
if [ $# -eq 0 -o $# -gt 1 ]; then
	echo "Error - número de argumentos no válido"
	echo "sintáxis: $0 número"
	echo "muestra la tabla de multiplicar de número"
	exit 1 # saldría del script con código de error=1
fi
if [ $(( $1+1 )) -eq 1 ] # no valida el 0
#if [ `expr $1+1` -eq 1 ]
then 
	echo "argumento no válido" 
	exit 2 
fi
# inicio del script con un número válido
echo "tabla de multiplicar del $1"
for i in {1..10}
do
 echo $1 x $i = $(($1*$i))
done







