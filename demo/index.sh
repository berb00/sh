#/!/bin/bash

:<<EOF
README
  功能: 配置development.js
       更新less (less监听需打开)
       安装package
  操作步骤:
    1、将改文件拷贝至项目下 如: f-hw4web-分支-（0326数据大屏效果优化）/
    2、在项目目录下打开gitbash
    3、$ sh index.sh [LINK] [PORT] [-i] [-u]
       传参都为可选 无固定顺序 以空格间隔
       LINK: 后端IP
       PORT: 前端端口
       -i:安装package
       -u:卸载package

  gitbash:  https://git-scm.com/download/win

EOF

path=`pwd`
LINK='192.168.10.85'      # 默认连接的后端IP
PORT='4159'               # 默认前端端口
                          # com.lyzh.saas.platform.ui     PORT
                          # com.lyzh.dw.ui                PORT + 1
                          # com.lyzh.dw.fill.ui           PORT + 2
                          # com.lyzh.saas.console         PORT - 1


# 本机IP
ipre="\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"
ipre1="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
ipline=`ipconfig | grep -a 'IPv4'`
IP=`echo $ipline | grep -Eo $ipre1`

# PORT
port=`echo  $* | grep -Eo '[0-9]{4}'`
if [ $port ];then
  PORT=${port:0:4}
fi

# LINK
LINK1=`echo  $* | grep -Eo $ipre1`
if [ $LINK1 ];then
  LINK=$LINK1
fi


dir=`ls -d */`
OLD_IFS="$IFS"
IFS=" "
arr=($dir)


IFS="$OLD_IFS"
arrlen=${#arr[@]}
#arr=()

# configure development.js
for i in ${arr} 
do
    if [[ ! $i =~ com.lyzh ]];then
      continue
    fi

    devpath=${path}/${i}config/development.js
    lesspath=${path}/${i}public/css/base.less

    # update less
    sed -i "1i\@import \"less/config\";" ${lesspath}
    sed -i "1d" ${lesspath}

    # configure port
    line=`sed -n -e '/development/=' ${devpath}`
    linenext=`expr $line + 1`
    port=$PORT
    if [ $i == "com.lyzh.dw.ui/" ];then
        port=`expr ${PORT} + 1`
    elif [ $i == "com.lyzh.dw.fill.ui/" ];then
        port=`expr ${PORT} + 2`
    elif [ $i == "com.lyzh.saas.console/" ];then
        port=`expr ${PORT} - 1`
    fi
    sed -i "${linenext}c \    port: ${port},         //服务端口号" $devpath

    # configue eureka
    sed -in-place -e 's/host: global/\/\/ host: global/g' $devpath
    sed -in-place -e 's/\/\/ \/\//\/\//g' $devpath
    sed -in-place -e 's/\/\/\/\//\/\//g' $devpath

    line1=`sed -n -e '/eureka: {/=' ${devpath}`
    sed -i "${line1}a\\        host: global.environment.eurhost \|\| \'${LINK}\'," ${devpath} # line1行后插入一行


    # configure webconnect
    if [[ $i =~ com.lyzh.saas.platform.ui/ ]];then
        line2=`sed -n -e '/hosturl_109/=' ${devpath}`
        if [ $line2 ];then
          sed -i "${line2}d" ${devpath}
        fi

        line2=`sed -n -e '/hosturl_110/=' ${devpath}`
        if [ $line2 ];then
            sed -i "${line2}d" ${devpath}
        fi

        line2=`sed -n -e '/hosturl_111/=' ${devpath}`
        if [ $line2 ];then
            sed -i "${line2}d" ${devpath}
        fi

        line2=`sed -n -e '/webconnect/=' ${devpath}`
        port=`expr $PORT + 2`
        sed -i "${line2}a\\        \\'hosturl_111\\':\\'${IP}:${port}\\', /**链接web端4111的服务地址*/" ${devpath}
#        sed -i "${line1}a\\        host: global.environment.eurhost \|\| \'${LINK}\'," ${devpath} # line1行后插入一行


        port=`expr $PORT + 1`
        sed -i "${line2}a\\        'hosturl_110':'${IP}:${port}', /**链接web端4110的服务地址*/" ${devpath}

        port=$PORT
        sed -i "${line2}a\\        'hosturl_109':'${IP}:${port}', /**链接web端4109的服务地址*/" ${devpath}
    fi
    rm -f ${path}/${i}config/development.jsn-place
done

# install package
if [[ $* =~ '-i' ]];then
  for i in ${arr}
  do
      if [[ ! $i =~ com.lyzh ]];then
        continue
      fi

      cd $path
      cd $i
      npm install &
#      sleep 10 &
#      wait
#      npm run run &
  done
  echo 'install......'
  sleep 60
fi

# uninstall package
if [[ $* =~ '-u' ]];then
  for i in ${arr}
  do
      if [[ ! $i =~ com.lyzh ]];then
        continue
      fi

      cd $path
      cd $i
      rm -rf ./node_modules  &
  done
  echo 'uninstall......'
  sleep 20
fi

echo 'Done......'

