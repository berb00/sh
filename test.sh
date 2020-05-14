#!/bin/bash

# =============数值测试==================
num1=10
num2=20
num3=$[num1+num2]               #  [] 执行基本的算数运算
echo $num3
echo `test $[num1] -eq $[num2]`
if test $[num1] -eq $[num2]
then
    echo "$num1 == $num2"
else
    echo "$num1 != $num2"
fi

# =============字符串测试================
str1='str1'
str2='str2'

if test $str1 = $str2
then
    echo "$str1 == $str2"
else 
    echo "$str1 != $str2"
fi

if test -z $str1
then 
    echo "$str1 的长度为0"
else
    echo "$str1 的长度不为0"
fi

if test -n $str1
then 
    echo "$str1 的长度不为0"
else
    echo "$str1 的长度为0"
fi


# =============文件测试==================
:<<EOF
-e 文件名 	如果文件存在则为真
-r 文件名 	如果文件存在且可读则为真
-w 文件名 	如果文件存在且可写则为真
-x 文件名 	如果文件存在且可执行则为真
-s 文件名 	如果文件存在且至少有一个字符则为真
-d 文件名 	如果文件存在且为目录则为真
-f 文件名 	如果文件存在且为普通文件则为真
-c 文件名 	如果文件存在且为字符型特殊文件则为真
-b 文件名 	如果文件存在且为块特殊文件则为真
EOF

if test -e ./test.txt
then
    echo './test.txt 存在'
else
    echo './test.txt 不存在'
fi