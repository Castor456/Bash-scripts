#!/bin/bash

func1()
{
echo "This message is from function 1"
}

func2()
{
echo "This message is from function 2"
}

func3()
{
echo "This message is from function 3"
}

echo "Call a function from 1 to 3:"
read n

func$n

if [ "$n" -ge 1 ] && [ "$n" -le 3 ]; then
	echo "Good job bruh!"

else
	echo "The number is not in range bruh"
fi

