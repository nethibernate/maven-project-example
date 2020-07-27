#!/bin/bash
source ~/.bash_profile

for I in {0..0}

do

	ssh ksgame-jy-busist$I.hb.txyun "cd /media/disk1/fordata/web_server/server/;unzip server.zip;rm -rf __*;mv server world;cd world;chmod 777 startup.sh;"

done

