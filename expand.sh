#!/bin/bash

src=$1
YEAR=`date +%Y`
TITLE=`grep '<h2>' $src | ./escape.sh | cut -b 5-`
len=`echo "$TITLE" | wc -c`
TITLE=`echo "$TITLE" | cut -b -$((len - 10))`
CONTENT=`grep -v '<h2>' $src | ./escape.sh`
NAVIGATION=`./escape.sh <navigation.html`

while read line; do
	line=`echo $line | sed -e "s/\\${TITLE}/$TITLE/"`
	line=`echo $line | sed -e "s/\\${CONTENT}/$CONTENT/"`
	line=`echo $line | sed -e "s/\\${NAVIGATION}/$NAVIGATION/"`
	line=`echo $line | sed -e "s/\\${YEAR}/$YEAR/"`
	echo -e $line
done
