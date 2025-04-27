#!/bin/bash

for file in `ls`
do
	if [ -x $file ]
	then
		echo File $file is executable
	fi
done
