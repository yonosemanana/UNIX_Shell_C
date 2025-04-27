#!/bin/bash

# This program checks if the user exists in the system

echo "Enter username to check: "
read user

# echo $user

if grep $user /etc/passwd > /dev/null 2>&1
then
	echo "$user exists in this sytem"
else
	echo "$user doesn't exist in this system"
fi
