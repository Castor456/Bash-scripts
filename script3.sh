#!/bin/bash

echo "Choose 1 or 2 for Yes or No"
read ans

if [ $ans -eq 1 ];then 
	export response="Yes"

elif [ $ans -eq 2 ];then 
	export response="No"

else 
	echo "select correct option"

fi

echo "The value you have selected is $response"

exit 0
