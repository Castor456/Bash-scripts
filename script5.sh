#!/bin/bash

func1()
{
 echo "Here is the result of addition:" 
 echo $(($num1 + $num2))
}

func2()
{
 echo "Here is the result of subtraction:" 
 let x=($num1 - $num2) ; echo $x
}

func3()
{
 echo "Here is the result of multiplication:"
 echo $(($num1*$num2))
}

func4()
{
echo "Here is the result of division:"
echo $(($num1/$num2))
}

echo "Welcome to my simple calculator"

echo "Enter the First number to work on:"
read num1

echo "Enter the Second number to work on:"
read num2

echo "Select the action you would like to perform: 1 for addition,2 for subtraction, 3 for multiplication, 4 for division."
read  action

func$action 

