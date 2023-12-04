#!/bin/bash
# script que recorre un número indeterminado de parámetros
#sintaxis: params.sh p1 p2 ...
echo "número de parámetros: $#"
for p in $*; do 
  echo "-->" $p
done
for p in "$@"; do 
  echo "-->" $p
done
while (( $# )) #mientras el número de parámetros no sea 0
do
  echo $1
  shift
done
