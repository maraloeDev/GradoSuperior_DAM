#!/bin/bash
while true
do 
	read -p "Nombre: " nombre
	[ -z $nombre ] && exit 0
	read -p "Apellidos: " apellidos
	read -p "Teléfono: " telefono
	echo $nombre,$apellidos,$telefono
done >> agenda.csv
