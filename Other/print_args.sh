#!/bin/bash

echo "Enter any number of arguments"

if [ $# -eq 0 ]
then
	echo "Enter at least one argument"
fi

arg_num=$#
while [ $((arg_num + 1)) -gt 1 ]
do
	var_num=$(($# + 1 - arg_num))
	echo ${!var_num}
	arg_num=$((arg_num - 1))
done
