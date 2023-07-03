#!/bin/bash

if [ $# -lt 3 ]
then
	echo "Min number of arguments is 3. 
Usage: $0 arg1 arg2 arg3 ..."
	exit 1
fi

for arg in "$@"
do
	echo $arg
done
