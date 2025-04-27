#!/bin/bash

# This scripts converts temperature in Fahrenheit to Celsius and prints it:
# Fahr = 0, 20, ..., 300

lower=0
upper=300
step=20

fahr=$lower
while [ $(echo "${fahr} <= ${upper}" | bc ) -ne 0 ] 
do 
	celsius=`echo "5.0 / 9.0 * ( $fahr - 32 )" | bc -l`
	echo $fahr, $(echo "scale = 1; $celsius / 1" | bc )
	fahr=$(echo "$fahr + $step" | bc )
done
