#!/bin/bash
ls -la | while read LINE
do
  set -- $LINE
  echo "$9 -> $3:$4 ($1)"
done >resultado
