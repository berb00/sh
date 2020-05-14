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
    # echo $i
    # 配置监听port
    line=`sed -n -e '/development/=' ${devpath}`
    linenext=`expr $line + 1`
    port=$PORT
    if [ $i == "com.lyzh.dw.ui/" ];then
        port=`expr ${PORT} + 1`
    elif [ $i == "com.lyzh.saas.console/" ];then
        port=`expr ${PORT} - 1`
    fi
    sed -i "${linenext}c    port: ${port},         //服务端口号" $devpath

    # 配置eureka
    # sed 's/host: global/Ahost: global/g' $devpath
    sed -in-place -e 's/host: global/\/\/ host: global/g' $devpath
    sed -in-place -e 's/\/\/ \/\//\/\//g' $devpath
    sed -in-place -e 's/\/\/\/\//\/\//g' $devpath

    line1=`sed -n -e '/eureka: {/=' ${devpath}`
    sed -i "${line1}a\\        host: global.environment.eurhost \|\| \'${LINK}\'," ${devpath} # line1行后插入一行
    
    # 配置webconnect
    if [ $i == "com.lyzh.saas.platform.ui/" ];then
        line2=`sed -n -e '/hosturl_109/=' ${devpath}`
        echo $line2+'===================================='
        line2next1=`expr $line2 + 1`
        line2next2=`expr $line2 + 2`
        sed -i "${line2next1}d" ${devpath}
        sed -i "${line2next2}d" ${devpath}
        sed -i "${line2}a\\\'hosturl_109\':\'${IP}:4129\', \/\*\*链接web端4109的服务地址\*\/" ${devpath} # line1行后插入一行
    fi

done
