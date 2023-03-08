#! /bin/bash

function menu () {
    while [[ $operator != "i" ]]
    do
      echo "a. Input a Series. (Replace the current series)"
      echo "Display the series in the order it was entered."
      echo "c. Display the series in sorted order (from low to high)."
      echo "d. Display the Max value of the series."
      echo "e. Display the Min value of the series."
      echo "f. Display the Average of the series."
      echo "g. Display the Number of elements in the series."
	  echo "h. Display the Sum of the series."
	  echo "i. Exit."
	  validation $@
      read -p "Please your choise: " operator 
	  case $operator in
      "a") replace_series ;;
	  "b") sort_series ;;
	  "c") max ;;
	  "d") min ;; 
	  "e") average;;
	  "f") display ;;
	  "h") sum_series ;;
	  esac
    done
}
#Number validation
function validation(){

}

#Input a Series. (Replace the current series)
function replace_series() {

}

#Display the series in the order it was entered.
function sort_series() {

}

function max() {

}

function min() {

}

function average() {

}

function display() {

}

function sum_series() {

}

