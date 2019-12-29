#!/bin/bash

files=`ls data/*.html | sort -r`
for file in data/*.html; do
	if [ "$file" == "data/index.html" ]; then
		continue
	fi
	if [ "$file" == "data/impressum.html" ]; then
		continue
	fi
	if [ "$file" == "data/datenschutz.html" ]; then
		continue
	fi
	title=`grep '<h2>' $file | cut -b 5-`
	len=`echo "$title" | wc -c`
	title=`echo "$title" | cut -b -$((len - 6))`
	name=`basename "$file"`
	echo "<li><a href=\"./$name\">$title</a></li>";
done
