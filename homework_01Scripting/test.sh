#!/bin/sh

# First homework
# $1 - filename of input log file
#
# Hengyong Xiang,  -- 4/05/2018


if [ $# -ne 1 ] ; then
  echo "Usage: input <log file>  "
  exit 1
fi

line_number=`wc -l $1 | awk '{print $1}'`
echo this file has $line_number gates!

real_path=`readlink -f $1`             #$1是用户输入的参数，如a.log
echo the path is "$real_path"

echo $1 | cut -d . -f1
filename=$(echo $1 | cut -d . -f1)
mkdir $filename 
#echo $filename
#mkdir -r $filename
#awk '$4 ~ /greenbox1/ {printf"%12s  %20s\n",$4,$5}' $1
#awk '$4 ~ /redbox1/ {printf"%12s  %20s\n",$4,$6}'$1  
awk '$4 ~ /greenbox1|redbox1/  || NR==4' $1 >$filename/box1.log
  
awk '$4 ~ /crossISI_4_8/ || NR==4' $1 > $filename/ISI.log
awk '$4 ~ /crossITI_8/ || NR==4' $1 > $filename/ITI.log

awk '$4 ~ /Display/ || NR==4' $1 > $filename/dis_scale.log 

awk '$6 ~ /pain/ {print $6,$8}' $1 > $filename/pain.log
awk '$6 ~ /vibration/ {print $6,$8}' $1 > $filename/vibration.log
awk '$5 ~ /Difficulty/ {print $5,$7}' $1 > $filename/Difficulty.log
awk '$5 ~ /Difference/ {print $5,$7}' $1 > $filename/Difference.log

awk 'BEGIN {
    sign = 0
    dis_count = 0
    res_count =0
    res_count1 = 0
    time_begin = 0
    time_scale = 0
}
#运行中
{
    if ($4 ~ /Display/){
       dis_count++; 
       sign = 1;
       time_begin = $6; 
    }
    else if ($3 ~ /Response/){
       res_count++;
       if(sign==1){
          res_count1++;
          sign =0;
          time_scale = ($5 - time_begin)/10000 ;
          printf"%f\n",time_scale > "time_scale.log";
       }
    }
    else {}
}
#运行后
END {
  print dis_count,res_count,res_count1    
}' $1

mv time_scale.log $filename/

