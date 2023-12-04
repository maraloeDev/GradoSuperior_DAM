#!/bin/bash
palos=(Copas Oros Espadas Bastos)
valores=(2 3 4 5 6 7 Sota Caballo Rey As)
for n in $(seq 1 4) # {1..4}
do
	echo ${valores[$RANDOM%10]} de ${palos[$RANDOM%4]}
done
