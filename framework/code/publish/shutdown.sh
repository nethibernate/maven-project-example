#!/bin/bash
source ~/.bash_profile
GAMEDIR=$(cd `dirname $0`; pwd)
id=`echo ${GAMEDIR%/*} |awk -F/ {'print $NF'}`
Pid=`/usr/sbin/lsof $GAMEDIR | grep java | awk '{print $2}'`

if [ -z "$Pid" ];then
	echo -e "\033[40;32m$id does not running!\033[0m"
        exit
fi

for i in $Pid
do
       (kill $i) 2> /dev/null &

done
echo "正在停止游戏..."

while true;do
        sleep 6 
        count=`/usr/sbin/lsof $GAMEDIR | grep java | awk '{print $2}'|wc -l`
        if [ $count -eq 0 ];then
	  echo -e "\033[40;33m$id has been killed!\033[0m" && exit
        else
          echo "5秒后强杀java进程..." && sleep 5 
	  echo -e "\033[40;32m 5秒后强杀 $id 进程...\033[0m" && sleep 5
          count2=`/usr/sbin/lsof $GAMEDIR | grep java | awk '{print $2}'`
	  for k9 in $count2;do
		kill -9 $k9
	  done
        fi
done

