#!/bin/bash
# tablero.sh
# muestra un tablero de 8x8 con casillas alternas
# 0x0x0x0x
# x0x0x0x0 
# ...
for ((j=1; j<=8; j++))
do
	for ((i=1; i<=8; i++))
	do
	 n=$((i+j))
	 if [[ $n%2 -eq 0 ]]; then
	  echo -n "1"
	 else
	  echo -n "0"
	 fi
	done
	echo
done
