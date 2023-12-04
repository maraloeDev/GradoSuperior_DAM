#!/bin/bash
# este script muestra la capital de un pais solicitado por teclado
# sintaxis: capitales.sh pais
declare -A capitales=([ESPAÑA]=Pucela [FRANCIA]=París)
read -p "País: " pais
pais=`echo $pais | tr [:lower:] [:upper:] | tr "ñ" "Ñ"`
#echo $pais
echo ${capitales[$pais]:="país no encontrado"}

