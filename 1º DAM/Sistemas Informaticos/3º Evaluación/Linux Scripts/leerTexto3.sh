#!/bin/bash
# sintaxis: ./leerTexto.sh nombreArchivo
# puede leer cualquier archivo de texto

#if [ $# -gt 0 ] && [ -f $1 ]; then # -f para archivos regulares (no directorios,...)

if [ $# -gt 0 ]; then
  if [ -f $1 ]; then
	n=1
	while read LINEA
	do
		echo "$n. $LINEA"
		((n++))
	done < $1
  else
   echo "ERROR: debe especificar un archivo de texto existente"
  fi
else
	echo "ERROR: debe especificar un archivo"
fi
