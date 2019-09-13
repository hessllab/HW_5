# state.sh
# Application: download .rwl files with Tree ring data from an specific State and obtain a list of files and site names that State.
# Usage: bash state.sh state_abbrev
# Products: 'state_abbrev'_sites.txt , 'state_abbrev'/directory containing the rwl files. 

# ## Part I: Downloading the data from the Internet 
# The following code downloads the files from the state that we have entered.  

wget -P $1 -nd -r -e robots=off -A $1'*.rwl' -R '*-noaa.rwl' -np -q https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/ #code to retrieve the data
 
# ## Part II: Loop to retrieve the site information from the files. ## 

# The following loop finds the file name, deletes the file extension and then writes a line to the file `sitename.txt`. It then adds another line with the information of the first line of that file. The loop continues until all the files have been processed.  

cd $1
for filename in *.rwl
do
echo $filename | cut -d . -f 1 >> "$1"_sites.txt
head -1 $filename >> "$1"_sites.txt
done

