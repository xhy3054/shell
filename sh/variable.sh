##!/bin/sh


echo $- 

#variable assignment
your_name="xhy"
#if you use a variable a,you should in the way '$a'

echo $your_name
#If you want to distinguish a variable a, you can use this form'${a}'
echo ${your_name}

for skill in Ada Coffe Action Java; do
	echo "I am good at ${skill}Script"
done
