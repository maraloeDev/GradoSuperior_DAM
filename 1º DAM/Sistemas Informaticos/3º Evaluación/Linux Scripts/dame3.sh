#!/bin/bash
# dame3.sh p1 p2 p3
echo el script se llama $0
echo -n '$1'=$1, '$2'=$2, '$3'=$3
echo " ...hay $# parámetros"
shift #desplaza una posición en el conjunto de parámetros
echo "Ahora solo quedan $# (después de ejecutar shift)"
shift
echo Ahora solo quedan $# \(después de ejecutar shift\)
echo '$1'=$1, '$2'=$2, '$3'=$3

