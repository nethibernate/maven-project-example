#!/bin/bash
source ~/.bash_profile

arr=(d e f g h i j k l m n o p q r s t u v w x y z aa ab ac ad)
i=0
for I in {0..0}
do
	echo server_${arr[i]}
	ssh ksgame-jy-busist$I.hb.txyun "cd /media/disk1/fordata/web_server/server/world/resources/;sed -i "4cworldServerId=zjb_tap_world_online_${arr[i]}" curconfig
.properties;"
	let i++
done
