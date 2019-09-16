##### The following script is in `states.sh` file.  
```  
# states.sh  
# Download all the .rwl files for a specified state from ITRDB website, and create a text file that contain site names and first line of each files.  
# Usage: bash state.sh state_abbrev_in_lowercase  
# Products: ./'state_abbrev'_directory/'state_abbrev'.rwl, 'state_abbrev'_sites.txt  

wget -P ./"${1^^}"/ -r -e robots=off -A "$1"'*.rwl' -R '*-noaa.rwl' -np -nd "https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/"
for filename in "${1^^}"/*.rwl
do
echo $filename | cut -d / -f 2 | cut -d . -f 1 >> ./"${1^^}"/"${1^^}"_sites.txt && cat $filename | head -n 1 >> ./"${1^^}"/"${1^^}"_sites.txt
done
```  

##### In the script, `"$1"` is set as a variable for any state abbreviations. This must be written in lower case letters.  
##### In `wget` line, `-P` flag means _prefix_, which sets or creates a directory structure for downloaded files to store them. In here, `./"${1^^}"/` will create a directory with the state abbreviation in the current working directory and set it as a saving destination for downloaded .rwl files. The incorporated `{}` and `^^` will convert lowercase letters into uppercase letters.  
##### Flag `-A` will define _accept list_ and flag `-R` will define _reject list_. These two flags will filter the files in the ITRDB website for download. `-A "$1"'*.rwl'` will select all the .rwl files starting with a specified state abbreviation, and `-R '*-noaa.rwl'` will exclude all the files ending with '-noaa'. In this way, `wget` can include .rwl files with extra letters after site numbers.  

##### In the for loop, the variable `filename` is set as all the .rwl files in the 'state_abbrev'_directory created in the previous command.  
##### The first set of commands in the loop before `&&` will extract only a file name before its' extension and append it to 'state_abbrev'_sites.txt.  
##### The second set of commands after `&&` will extract the first line in the file and append it into the same text file.  