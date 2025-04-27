#!/bin/bash

echo Enter two numbers:

read a b extra

if [[ -n "$extra" || -z "$a" || -z "$b" ]]
then	
	echo Exactly two numbers are required!
	exit 1
fi

sum=$((a + b))
echo Sum $a + $b = $sum



