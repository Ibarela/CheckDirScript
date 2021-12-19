#!/bin/bash

cont=0

for i in {1..10}
do
	if [ $i -lt 10 ]
	then
		docker exec $1 test -d /root/0$i && cont=$[cont +1] || cont=$[cont +0]
		if [ $i != $cont ]
		then
			echo No existe el directorio /root/0$i
			exit
		fi
	else
		docker exec $1 test -d /root/$i && cont=$[cont +1] || cont=$[cont +0]
		if [ $i != $cont ]
		then
			echo No existe el directorio /root/$i
			exit
		else echo CORRECTO
		fi
	fi
done
