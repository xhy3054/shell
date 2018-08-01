#!/bin/bash

#awk其实是个脚本解释器

awk 'NR!=1{if($6 ~ /TIME|ESTABLISHED/) print > "1.txt";
else if($6 ~ /LISTEN/) print > "2.txt";
else print > "3.txt" }' test.log
