#!/bin/bash
palos=(Copas Oros Espadas Bastos)
valores=(2 3 4 5 6 7 Sota Caballo Rey As)
n=1
until [ $n -gt 4 ]
do
	carta="${valores[$RANDOM%10]} de ${palos[$RANDOM%4]}"
	repe="N"
	for ((i=0;i<n;i++))
	do
		if [[ "$carta" = "${cartas[i]}" ]] #IMPORTANTE: las comillas
		then
			repe="S"
			break #perdón Macarena
		fi
	done
	if [ $repe = "N" ];
	then
		cartas[n]=$carta
		echo $carta
		((n++))
	fi
done

#test de prueba con 1000 propuestas:
#for i in {1..1000};do n=$( ./4cartas.v2.sh | wc -l ); [ $n -ne 4 ] && echo ERR;done 