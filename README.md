### ITRDB Script for Any State
Zack Grzywacz

For this script, the user must add the state abbreviation after typing "bash state.sh". This makes the state abbreviation take the spot of "$1" in the code. We will start by making and entering a new directory, so that the paths are absolute and can be replicated anywhere.
```
# Download tree ring data for any US State  
# Usage: bash state.sh state_abbreviation  
mkdir "$1"_trees
cd "$1"_trees
```

Next, we will gather the data with wget. This uses two wget requests because some state codes have an extra letter at the end - yet we do not want the files that contain "-noaa". So we use ? wildcards instead of *.
```
wget -r -e robots=off -A "$1"???.rwl -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
wget -r -e robots=off -A "$1"????.rwl -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
```

Now, we will use a loop to print the site name and first line of each file to a .txt file. Note that only the first five characters are cut from the filename - this leaves off any extra letters at the end of the files that are formatted like "az544t.rwl". I do this assuming that the letter 't' is not a part of the site name.
```
for filename in *.rwl
 do
  ls "$filename" | cut -c 1-5 >> "$1"_sites.txt
  head -n 1 "$filename" >> "$1"_sites.txt
 done
```
