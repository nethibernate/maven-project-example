#!/bin/bash
source ~/.bash_profile
export LD_LIBRARY_PATH=./libs:$LD_LIBRARY_PATH

# 世界服务器0

# 设置启动参数
RUN_PARAM=$1

# 设置加载类的环境变量 运行主类名
CPATH="./:./libs/*"
MAIN=$2
# 设置运行参数
#JAVA_PARAMS="-server -Xms2560m -Xmx2560m -Xmn1024m -XX:MaxDirectMemorySize=512m"
#JAVA_PARAMS="-server -Xms7168m -Xmx7168m -Xmn4096m -XX:MaxDirectMemorySize=1024m" #10G服务器
JAVA_PARAMS="-server -Xms9216m -Xmx9216m -Xmn3456m -XX:MaxDirectMemorySize=1024m" #16G服务器
#JAVA_PARAMS="-server -Xms16384m -Xmx16384m -Xmn5529m -XX:MaxDirectMemorySize=1024m" #24G+服务器
JAVA_PARAMS="$JAVA_PARAMS -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+AlwaysLockClassLoader"
JAVA_PARAMS="$JAVA_PARAMS -XX:+DisableExplicitGC"
JAVA_PARAMS="$JAVA_PARAMS -XX:+PrintGCDateStamps -XX:+PrintGCDetails -verbose:gc -Xloggc:./logs/gc/gc_%p.log"
JAVA_PARAMS="$JAVA_PARAMS -XX:ErrorFile=./logs/error/hs_err_%p.log -XX:HeapDumpPath=./logs/error/heap_dump_err_%p.hprof"
JAVA_PARAMS="$JAVA_PARAMS -XX:+HeapDumpOnOutOfMemoryError"
#JAVA_PARAMS="$JAVA_PARAMS -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=8000"
#JAVA_PARAMS="$JAVA_PARAMS -agentlib:jprofilerti=port=8849-Xbootclasspath/a:/opt/home/service/hebowen/jprofiler9/bin/agent.jar"
#JAVA_PARAMS="$JAVA_PARAMS -javaagent:./libs/hotagent.jar"
echo "========================================================================="
echo ""
echo "  ZS World0 Server Environment"
echo ""
echo "  JAVA_PARAMS: $RUN_PARAM $MAIN $CPATH $JAVA_PARAMS"
echo ""
echo "========================================================================="
echo ""

java $JAVA_PARAMS -Djava.library.path=./libs -cp $CPATH $MAIN $RUN_PARAM
