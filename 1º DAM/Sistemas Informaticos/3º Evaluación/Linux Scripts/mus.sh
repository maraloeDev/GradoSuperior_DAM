#!/bin/bash

function MostrarBaraja {
for i in $(seq 0 39); do
  echo ${baraja[i]}
done 
}

function Barajar {
#read -s -n1 -t3 -p "Pulsa una tecla para barajar"; echo #salto de línea
for i in $(seq 0 39); do
  n=$((RANDOM%40))
  # swap
  g=${baraja[i]}
  baraja[i]=${baraja[n]}
  baraja[n]=$g
done 
}

function CrearBaraja {
palos=(Copas Oros Espadas Bastos)
valores=(2 3 4 5 6 7 Sota Caballo Rey As)
for p in $(seq 0 3); do
  for v in $(seq 0 9);do
    baraja[$((p*10+v))]=$(echo ${valores[v]} de ${palos[p]})
  done
done 
}

function Repartir() {
 c=0
 for n in $(seq 0 3); do
  for j in $(seq 0 3); do
   cartas[((j+n*4))]=${baraja[((c++))]}
  done
 done
}

function MostrarCartas {
 for j in $(seq 0 3); do
  echo "Jugador $j:"
  for n in $(seq 0 3); do
   echo -n "\"${cartas[((j+n*4))]}\" "
  done
  echo
 done
}

#--punto de entrada al script
CrearBaraja
#MostrarBaraja
Barajar
#MostrarBaraja
Repartir  
MostrarCartas