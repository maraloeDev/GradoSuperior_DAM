#!/bin/bash

while read LINE
do
 set -- $LINE # asigna los parámetros posicionales ($1 $2 ...) 
			  # desde los "campos" de LINE 
 #[ ${#3} -gt 0 ] && echo "$9 -> $3:$4 ($1)"
 #[ $# -eq 9 ] && echo "$9 -> $3:$4 ($1)"
 ! [ -z $3 ] && echo "$9 -> $3:$4 ($1)"
done < <(ls -l) >archivo.lst
