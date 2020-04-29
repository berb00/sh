#!/bin/bash

# 运算符
:<<EOF
bash本身不具备计算功能 可借助其他命令完成(expr、awk)

EOF


a=10
b=20

val=`expr 2 + 2`            # 表达式之间要有空格 2+2错误

# ======================算术运算符======================
add=`expr $a + $b`
echo "$a + $b : ${add}"

sub=`expr $a - $b`
echo "$a - $b : ${sub}"

multiply=`expr $a \* $b`
echo "$a * $b : ${multiply}"

divide=`expr $a / $b`
echo "$a / $b : ${divide}"

modle=`expr $a % $b`
echo "$a % $b : ${modle}"

equal=`expr $a == $b`
echo "$a == $b : ${equal}"

notequal=`expr $a != $b`
echo "$a != $b : ${notequal}"


# ======================关系运算符======================
echo "==============================="

if [ $a -eq $b ]; then
    echo "-eq : $a == $b"
else
    echo "-eq : $a != $b"
fi



if [ $a -le $b ]
then
   echo "$a -le $b: a 小于或等于 b"
else
   echo "$a -le $b: a 大于 b"
fi




