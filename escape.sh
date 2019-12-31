#!/bin/bash
while read line; do
	line=`echo $line | sed -e 's/\\\\/\\\\\\\\/g' -e 's/\\//\\\\\\//g' -e 's/&/\\\\\\&/g'`
	echo -n "$line\\\\n"
done
