#! /bin/bash

function menu () {

echo "a. Input a Series. (Replace the current series)"
      echo "b. Display the series in the order it was entered."
      echo "c. Display the series in sorted order (from low to high)."
      echo "d. Display the Max value of the series."
      echo "e. Display the Min value of the series."
      echo "f. Display the Average of the series."
      echo "g. Display the Number of elements in the series."
	  echo "h. Display the Sum of the series."
	  echo "i. Exit."

  
    while [[ $operator != "i" ]]
    do
 #validation $@
	  case $operator in
      "a") replace_series ;;
	  "b") sort_series ;;
	  "c") max ;;
	  "d") min ;; 
	  "e") average ;;
	  "f") display ;;
	  "h") sum_series ;;
	  esac
	  read -p "Please your choise: " operator 
    done
}
menu
#Number validation
function validation(){
for arg in "$@" 
do
	while ! [[ $arg =~ "^[0-9]+$" ]] 
	do
	read -p "Please enter a number: " arg
	done
done
}
#Input a Series. (Replace the current series)
function replace_series() {

read -p "Please enter a new serial: " num1 num2 num3
validation $num1 $num2 $num3
echo " $num1 $num2 $num3"
}
#replace_series

#Display the series in the order it was entered.

function max() {
if [[ $1 -ge $2 ]] && [[ $1 -ge $3 ]]
then
	echo "$1"
	elif [[ $2 -ge $1 ]] && [[ $2 -ge $3 ]]
	then
		echo  "$2"
	else
		echo "$3"
fi 
}
#max
function min() {
if [[ $1 -le $2 ]] && [[ $1 -le $3 ]]
then
	echo "$1"
	elif [[ $2 -le $1 ]] && [[ $2 -le $3 ]]
	then
		echo  "$2"
	else
		echo "$3"
fi 
}
#min

#from low to high
function sort_series() {
read -p "Please enter a series: " num1 num2 num3
validation $num1 $num2 $num3
max1=$(max $num1 $num2 $num3)
min1=$(min $num1 $num2 $num3)
mid=$num1
if [[ $max1 != $num2 ]] && [[ $min1 != $num2 ]]
then
        ((mid=$num2))
#echo $min1
elif [[ $max1 != $num3 ]] && [[ $min1 != $num3 ]]
then
        ((mid=$num3))
else
        ((mid=$num1))
        echo "mid updated to $num1"
fi
echo "$min1 $mid $max1"
}
#sort_series



function average() {
sum=$1+$2+$3
echo "The avarage is $((sum/3))"
}
#average
function display() {
echo "$1 $2 $3"
}
#display
function sum_series() {
sum=$1+$2+$3
echo "The sum is $((sum)) "
}
#sum_series
