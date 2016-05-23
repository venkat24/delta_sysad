#!/bin/bash
mkdir sysad
touch sysad/file{1..100}
truncate -s 10240 sysad/file*
for file in sysad/file*
do
	head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16 > $file
	sudo chmod 444 $file
	touch -d "2 days ago" $file
	chattr +i $file
done
