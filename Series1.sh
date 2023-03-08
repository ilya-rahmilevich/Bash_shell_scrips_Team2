#!/bin/bash
# Function to validate input as positive numbers
function validate_input() {
  flag=0
  while [[ $flag -eq 0 ]]; do
    counter=0
    for arg in "$@"; do
      if [[ $arg =~ ^[0-9]+$ && $arg -gt 0 ]]; then
        ((counter++))
      else
        break
      fi
    done
    if [[ $counter -eq 3 ]]; then
      flag=1
    else
      read -p "Please enter a series of three positive numbers: " arg1 arg2 arg3
      set -- $arg1 $arg2 $arg3
    fi
  done
}

# Function to validate input as positive numbers
function validate_input() {
  flag=0
  while [[ $flag -eq 0 ]]; do
    counter=0
    for arg in "$@"; do
      if [[ $arg =~ ^[0-9]+$ ]]; then
        ((counter++))
      else
        break
      fi
    done
    if [[ $counter -eq 3 ]]; then
      flag=1
    else
      read -p "Please enter a series of three positive numbers: " arg1 arg2 arg3
      set -- $arg1 $arg2 $arg3
    fi
  done
}

# Function to replace the current series
function replace_series() {
  read -p "Please enter a new series of three positive numbers: " num1 num2 num3
  validate_input $num1 $num2 $num3
  series=($num1 $num2 $num3)
}

# Function to display the series in the order it was entered
function display_series() {
  echo "Series: ${series[@]}"
}

# Function to display the series in sorted order
function sort_series() {
  sorted_series=($(echo "${series[@]}" | tr " " "\n" | sort -n))
  echo "Sorted Series: ${sorted_series[@]}"
}

# Function to display the maximum value in the series
function display_max() {
  max=${series[0]}
  for num in "${series[@]}"; do
    if [[ $num -gt $max ]]; then
      max=$num
    fi
  done
  echo "Max: $max"
}

# Function to display the minimum value in the series
function display_min() {
  min=${series[0]}
  for num in "${series[@]}"; do
    if [[ $num -lt $min ]]; then
      min=$num
    fi
  done
  echo "Min: $min"
}

# Function to display the average of the series
function display_average() {
    sum=$((${series[0]}+${series[1]}+${series[2]}))
    average=$(echo "$sum / 3" | bc -l)
    echo "Average: $average"
}

# Function to display the number of elements in the series
function display_count() {
    count=${#series[@]}
    echo "Count: $count"
}

# Function to display the sum of the series
function display_sum() {
    sum=$((${series[0]}+${series[1]}+${series[2]}))
    echo "Sum: $sum"
}

# Initialize the series
if [[ $# -eq 3 ]]; then
    validate_input $1 $2 $3
    series=($1 $2 $3)
else
    replace_series
fi

# Main menu loop
while true; do
    echo "MENU"
    echo "a. Input a Series. (Replace the current series)"
    echo "b. Display the series in the order it was entered."
    echo "c. Display the series in sorted order (from low to high)."
    echo "d. Display the Max value of the series."
    echo "e. Display the Min value of the series."
    echo "f. Display the Average of the series."
    echo "g. Display the Number of elements in the series."
    echo "h. Display the Sum of the series."
    echo "i. Exit."
    read -p "Enter your choice: " choice
    case $choice in
        a) replace_series ;;
        b) display_series ;;
        c) sort_series ;;
        d) display_max ;;
        e) display_min ;;
        f) display_average ;;
        g) display_count ;;
        h) display_sum ;;
        i) exit 0 ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
    echo ""
done

