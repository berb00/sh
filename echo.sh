#!/bin/bash

str='string'
echo "it is a string"        # 显示普通字符串
echo "it\`s a symbol: \""    # 显示转义字符串

# read name                    # 读取输入
# echo "you has input: $name"

echo -e "this is first line \n "     # 开启转义

echo "this is first line \n this is second line"       # 换行
echo "line1 \c line2"

echo 'a' > test.txt           # 输出重定向至文件(覆写) 无文件则新建

echo '$str'                     # 使用单引号不进行转义或取变量

echo `date`                     # 显示命令结果





