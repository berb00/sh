#/!/bin/bash


path=`pwd`
IP='192.168.8.114'
LINK='192.168.10.240'
PORT='4179'

dir=`ls -d */`          # 获取所有目录名
OLD_IFS="$IFS"
IFS=" "
arr=($dir)
IFS="$OLD_IFS"
arrlen=${#arr[@]}

# sed -n -e '/development/p' ./com.lyzh.saas.platform.ui/config/development.js          # 获取关键字development 所在行内容
# sed -n -e '/development/p' ./com.lyzh.saas.platform.ui/config/development.js          # 获取关键字development 所在行行号

for i in ${arr}
do
    devpath=${path}/${i}config/development.js
    echo $i;
    # 配置监听port
    line=`sed -n -e '/development/=' ${devpath}`;
    linenext=`expr $line + 1`;
    port=$PORT;
    if [ $i == "com.lyzh.dw.ui/" ];then
        port=`expr ${PORT} + 1`;
    else if [ $i == "com.lyzh.saas.console/" ];then
        port=`expr ${PORT} - 1`;
    fi
    # sed -i "${linenext}c    port: ${port},         //服务端口号" $devpath

    # 配置eureka
    # sed 's/host: global/Ahost: global/g' $devpath
    # sed -in-place -e 's/host:/Ahost:/g' $devpath
done
