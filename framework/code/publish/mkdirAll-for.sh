#!/bin/bash
source ~/.bash_profile

for num in {0..0} 
do
	ssh ksgame-jy-busist${num}.hb.txyun "cd /media/disk1/fordata/web_server/;mkdir server;" 
done