#! /bin/bash

INDEX="assets-external.txt"

for i in `cat $INDEX`
do
	echo Deleting $i.png
	rm -f assets-dark/$i.png
done
exit 0
