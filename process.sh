#!/bin/bash

# 流程控制 process control

# ======================for======================

function basefor() {
    num1=10
    num2=20
    for i in $num1 $num2
    do
        echo "$i"
    done  
}


function arrfor () {
    arr=(10 20 30 'str')
    for i in ${arr[@]}
    do
        echo $i
    done


    for i in $( seq 1 10 )          # seq 用于产生从某个数到另外一个数之间的所有整数
    do
        echo $i
    done

}


# 列出DIR目录下各子目录占用磁盘空间的大小
function listdisk () {
    dir="/e/test/test"
    cd $dir
    for k in $(ls $dir)
    do
    [ -d $k ] && du -sh $k
    done 
}



# ======================while======================
# 99乘法表
function while99 () {
    a=1
    b=1
    while ((a <=9))
    do
        while ((b<=a))
        do
            let "c=a*b"   # 声明变量c
            echo -n  "$a*$b=$c "
            let b++
        done
        let a++
        let b=1  # 因为每个乘法表都是1开始乘，所以b要重置
        echo ""  # 显示到屏幕换行
    done
}


# ======================until======================
# 99乘法表
function until99 () {
    a=1
    b=1
    until ((a>9)) #until 和while相反，条件假的执行，条件真就done结束
    do
        until ((b>a))
        do
            let "c=a*b"
            echo -n "$a*$b=$c "
            let b++
        done
        let a++
        let b=1
        echo ""
    done
}

# ======================for======================
basefor
arrfor
listdisk

# ======================while======================
while99

# ======================until======================
until99