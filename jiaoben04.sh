#!/bin/bash

#difference of "" ''
n=74
str1=amao$n str2="amao is yun\"messi\"!!!$n"
str3='amao is also yuhuan messi $n'
echo $str1
echo $str2
echo $str3
echo ${#str3}  #get the length
str4=$str1$str2
str5="$str1 $str2"
str6="$str1 : $str2"
str7="${str1}========${str2}========"
echo $str4
echo $str5
echo $str6
echo $str7
