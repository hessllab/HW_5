# ITRDB script for any state
Goal of this assignment was to optimize the script from HW_4 so that it can run for any data
in the ITRDB. In addition this script will create a new directory for any given state and 
place all respective files into this new directory.

## Part 1
```
mkdir "$1"
cd "$1"
```
This makes a directory for any given state (using wild card $1 as the state abbreviation) then changes right into that 
new directory. All files created from the following code will then be placed into this new
directory.

## Part 2
```
wget -r -e robots=off -A "$1"*.rwl -R *noaa* -np -nH -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
```
This line of code uses wget to pull all rwl files for a specified state (again using $1 to indicate it could be any state) 
while excluding any files that contained noaa in their names.

## Part 3
```
for sitename in "$1"*.rwl
do
  echo $sitename | cut -d '.' -f 1 >> "$1"_sites.txt
  head -n 1 $sitename >> "$1"_sites.txt
done
```
This for loop reports the sitename and first line from the header of each rwl file from a specificed state into a new text file named
sites.txt. It ultilizes the cut command and uses the period as a delimiter along with " -f 1 " to report anything that comes
before the period. This loop will work for any state, again as the wildcard $1 can be subsituted for any state abbreviation.
