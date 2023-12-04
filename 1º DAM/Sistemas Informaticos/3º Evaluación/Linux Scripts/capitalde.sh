#!/bin/bash
# este script muestra la capital de un pais proporcionado como  parámetro
# sintaxis: capitalde.sh pais
declare -A capitales=([ESPAÑA]=Pucela [FRANCIA]=París)
pais=`echo $1 | tr [:lower:] [:upper:] | tr "ñ" "Ñ"`
echo ${capitales[$pais]:="país no encontrado"}

