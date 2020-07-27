#!/bin/bash
source ~/.bash_profile

for I in {0..0}
do
	ssh ksgame-jy-ksdx$I.hb.txyun "cd /media/disk1/fordata/web_server/server/world/;sh startWorld.sh;"
done
