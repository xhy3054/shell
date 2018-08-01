#!/bin/awk -f
#运行前
BEGIN {
	num = 0
	begin_time = 0
	ISI = 0
	ITI = 0
	sign = 0
	Rating_begin = 0
	Rating_end = 0
	pain = 0
	vibration = 0
	Difficulty = 0
	Difference = 0
}
#运行中
{
	if($4 ~ /greenbox1|redbox1/){
		num++;
		begin_time = ($5)/10000;
		printf"\n \n%d.\n",num > "read.log";
		printf"begin_time   : %20f\n",begin_time >"read.log";
	}
	if($4 ~ /crossISI_4_8/){
		ISI = ($5)/10000 - begin_time;
		printf"ISI          : %20f\n",ISI >"read.log";
	}
        if($4 ~ /crossITI_8/){
                ITI = ($5)/10000 - begin_time;
                printf"ITI          : %20f\n",ITI >"read.log";
        }
	if($4 ~ /Display/){
		sign = 1;
       		Rating_begin = ($6)/10000 - begin_time;
		printf"Rating_begin : %20f\n",Rating_begin >"read.log"; 
	}
	if($3 ~ /Response/){
       		if(sign==1){
          		sign =0;
          		Rating_end = ($5)/10000 - begin_time - Rating_begin ;
          		printf"Rating_end   : %20f\n",Rating_end > "read.log";
       		}	
    	}
	if($6 ~ /pain/){
		pain = $8;
		printf"pain         : %20d\n",pain >"read.log";
	}
        if($6 ~ /vibration/){
                vibration = $8;
                printf"vibration    : %20d\n",vibration >"read.log";
        }
        if($5 ~ /Difficulty/){
                Difficulty = $7;
                printf"Difficulty   : %20d\n",Difficulty >"read.log";
        }
        if($5 ~ /Difference/){
                Difference = $7;
                printf"Difference   : %20d\n",Difference >"read.log";
        }


}
#运行后
END {
    
}
