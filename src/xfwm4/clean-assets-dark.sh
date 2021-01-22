#! /bin/bash

INDEX="assets.txt"

for i in `cat $INDEX`
do
	echo Deleting $i.png
	rm -f xfwm4-dark/$i.png
done
exit 0
