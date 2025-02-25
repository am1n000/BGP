#!/bin/bash


if [ $(docker ps -q | wc -l) -gt 4 ] || [ $(docker ps -q | wc -l) -lt 4 ]
then
	echo 'Abort'
	exit 1
fi

for id in $(docker ps -q);do
	hostname=$(docker inspect -f '{{.Config.Hostname}}' $id)
	cat _ael-rhai-${hostname: -1} | docker exec -i $id sh
done
