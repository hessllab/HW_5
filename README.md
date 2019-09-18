#Caleb Malay HW_5

Creates directory to store downloaded tree ring data using `$1` as a variable for the state abbreviations. 
```bash
mkdir "$1"_TreeRingData
cd "$1"_TreeRingData
```

Uses wget to download state tree ring data ending with `.rwl` and uses `-R` to exclude downloading files that contain `noaa` in the name.
Using `"$1"*.rwl` uses a variable to also include files that may have a letter at the end of their name. 
```bash
wget -r -q -A "$1"*.rwl -R '*noaa*' -e robots=off -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
```

Uses a `for loop` to print the file name then uses `.` as the delimeter and `-f 1` to select the first column as well as taking the first
line of each file and sending it to a text file. Placing `"$1"` in front of the text file name allows for the desired state's abbreviation
to be placed before `_sites.txt.`
for filename in *.rwl
  do
    echo "$filename" | cut -d '.' -f 1 >> "$1"_sites.txt
    head -n 1 "$filename" >> "$1"_sites.txt
  done
