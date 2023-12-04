#!/bin/bash
# sintaxis: ./leerTexto4.sh nombreArchivo ...
# puede leer cualquier archivo de texto

if [ $# -gt 0 ]; then
 while [ $# -gt 0 ]
 do
	  if [ -f $1 ]; then
		n=1
		echo "archivo $1: "
		while read LINEA
		do
			echo "$n. $LINEA"
			((n++))
		done < $1 #redirector de entrada para read LINEA
	  else
	   echo "ERROR ($1): debe especificar un nombre de archivo de texto"
	  fi
	  shift
	  echo "------------------"
 done
else
	echo "ERROR: debe especificar al menos un archivo"
fi

