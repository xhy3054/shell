#!/bin/awk -f
#运行前
BEGIN {
    sign = 0
    time_begin = 0
    time_scale = 0
}
#运行中
{
    if ($4 ~ /Display/){ 
       sign = 1;
       time_begin = $6; 
    }
    else if ($3 ~ /Response/){
       if(sign==1){
          sign =0;
          time_scale = ($5 - time_begin)/10000 ;
          printf"%f\n",time_scale > "time_scale.log";
       }
    }
    else {}
}
#运行后
END {
    
}
