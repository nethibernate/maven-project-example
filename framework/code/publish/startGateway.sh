#!/bin/bash

source ~/.bash_profile
GAMEDIR=$(cd `dirname $0`; pwd)
id=`echo ${GAMEDIR%/*} |awk -F/ {'print $NF'}`
Pid=`/usr/sbin/lsof $GAMEDIR | grep java | awk '{print $2}'`

if [ ! -z "$Pid" ];then
	echo -e "\033[40;32mError:游戏$id正在运行!\033[0m"
        exit
fi


cd $GAMEDIR
[ ! -d ./logs/gc ]&&mkdir ./logs/gc -p
[ ! -d ./logs/error ]&&mkdir ./logs/error -p
nohup ./startup.sh 0 com.xxx.game.world.gateway.GatewayStartup >/dev/null 2>nohup.err &
echo -e "\033[40;36m$id starting....\033[0m"
tailf  ./logs/stream.log
