#!/bin/bash

# 运算符
:<<EOF
bash本身不具备计算功能 可借助其他命令完成(expr、awk)

EOF


a=10
b=20

val=`expr 2 + 2`            # 表达式之间要有空格 2+2错误

add=`expr $a + $b`
echo "a + b : ${add}"

sub=`expr $a - $b`
echo "a - b : ${sub}"

multiply=`expr $a \* $b`
echo "a * b : ${multiply}"

divide=`expr $a / $b`
echo "a / b : ${add}"

modle=`expr $a % $b`
echo "a % b : ${add}"

equal=`expr $a == $b`
echo "a == b : ${equal}"

notequal=`expr $a != $b`
echo "a != b : ${notequal}"












