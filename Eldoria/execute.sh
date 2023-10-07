#!/bin/bash

# check src directory
if [ ! -d src ]
then
  exit 1
fi

# create out directory
if [ ! -d src ]
then
  mkdir -p out
fi


# array to store values
values=()

# loop over src directory
for file in src/*.csv
do
  # check if the file is not empty
  if [ -s "$file" ]
  then
    # extract and convert values
    while IFS=, read -r item gold_drakes
    do
      # check if gold_drakes is a number
      if [[ $gold_drakes =~ ^[0-9]*(\.[0-9]*)?$ ]]
      then
        # convert gold_drakes to silver sovereigns and round to 2 decimal places
        silver_sovereigns=$(bc -l <<< "scale=2; $gold_drakes * 178")
        values+=("$item,$silver_sovereigns")
      fi
    done < "$file"
  fi
done

# sort values numerically in descending order
IFS=$'\n' sorted_values=($(sort -t, -k2,2 -rn <<< "${values[*]}"))

# create merged-scrolls.csv file
echo "Item,Value(SilverSovereigns)" > out/merged-scrolls.csv
for row in "${sorted_values[@]}"
do
  echo "$row" | awk -F',' '{printf "%s,%.2f\n", $1, $2}' >> out/merged-scrolls.csv
done