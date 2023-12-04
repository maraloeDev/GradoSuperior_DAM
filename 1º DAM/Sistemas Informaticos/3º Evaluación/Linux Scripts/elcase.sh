#!/bin/bash
# reconoce el tipo de un parámetro (simulación)
# objetivo: uso de case
tipo=$1
case $tipo in
"A")
	echo "es de tipo A"
	echo "etc..."
	;;
"B")
	echo "es de tipo B"
	;;
"C")
	echo "es de tipo C"
	;;
*)
	echo "es de tipo desconocido"
esac
