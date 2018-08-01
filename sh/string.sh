##!/bin/sh
your_name='xhy'
#the difference of '' and ""
greeting1="hello, "$your_name" !"
greeting2='hello, "$your_name" !'
echo $greeting1
echo $greeting2

string="abcd"
echo ${#string} #获取字符串长度,输出：4

string="alibaba is a great company"
echo `expr index "$string" is`
#输出：3，意思：找出字母i在这名话中的位置，要在linux下运行，mac下会报错
