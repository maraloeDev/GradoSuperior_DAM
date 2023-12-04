#!/bin/bash
function GenerarBaraja {
	palos=(Copas Oros Espadas Bastos)
	valores=(2 3 4 5 6 7 Sota Caballo Rey As)
	for p in $(seq 0 3); do
		for v in $(seq 0 9); do
			baraja[$((p*10+v))]=$(echo ${valores[v]} de ${palos[p]})
		done
	done
}

function MostrarBaraja {
	for i in $(seq 0 39);do
		echo ${baraja[i]}
	done
}

function Barajar {
	for i in $(seq 0 39); do
		n=$((RANDOM%40))
		g=${baraja[i]}
		baraja[i]=${baraja[n]}
		baraja[n]=$g
	done
}

function Continuar {
	read -n1 -s -p "Pulsa una tecla para barajar"; echo
}

GenerarBaraja
MostrarBaraja
Continuar
Barajar
MostrarBaraja
Continuar
Barajar
MostrarBaraja





