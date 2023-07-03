#!/bin/bash

echo "Trying to create a temporary file in /root..."
touch /root/tmp.$$ 2>&1

if [ $? -ne 0 ]
then
	echo "Error!"
	echo "Now trying to create a temporary file tmp.$$ in /tmp."
	touch /tmp/tmp.$$
fi

