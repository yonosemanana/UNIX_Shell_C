#!/bin/bash

if [ "$1" = "" ]
then
	echo "Usage $0 zone"
	exit 1
fi

ZONE=$1

SERVERS=`dig +short NS $ZONE`

if [ "$SERVERS" != "" ]
then
	echo "The zone $ZONE has these authoritative nameservers (and serial numbers): "
fi


for SERVER in $SERVERS
do
	### echo "$i + Hello"
	DIG_OUTPUT=`dig SOA +noauthority +noadditional +noquestion +nostats $ZONE @$SERVER`
	### echo "$DIG_OUTPUT"
	regex1=";; flags: (.*); QUERY: [0-9]+, ANSWER: ([0-9]+), AUTHORITY: [0-9]+, ADDITIONAL: [0-9]+"
	[[ "$DIG_OUTPUT" =~ $regex1 ]]
	### echo "${BASH_REMATCH[0]}"
	flags=${BASH_REMATCH[1]}
	n_ans=${BASH_REMATCH[2]}

	if [ $n_ans -gt 0 ] && [[ "$flags" =~ .*"aa".* ]]
	then
		### echo "The zone $ZONE has $n_ans authoritative DNS answers"
		### regex2_1=";; ANSWER SECTION:[[:space:]]+" #([0-9a-zA-Z.-]+)[:space:]+[0-9]+[:blank:]+IN"
		### regex2_2="DiG"
		regex2=";; ANSWER SECTION:[[:space:]]+([0-9a-zA-Z.-]+)[[:blank:]]+[0-9]+[[:blank:]]+IN[[:blank:]]+SOA[[:blank:]]+[0-9a-zA-Z.-]+[[:blank:]]+[0-9a-zA-Z.-]+[[:blank:]]+([0-9]+) [0-9]+ [0-9]+ [0-9]+ [0-9]+"
		[[ $DIG_OUTPUT =~ $regex2 ]]
		### echo "${BASH_REMATCH[0]}"
		### echo "${BASH_REMATCH[1]}"
		SERIAL="${BASH_REMATCH[2]}"
		### echo $regex2
		
		echo "$SERVER has serial number $SERIAL"
	fi

done
