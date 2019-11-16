### ITRDB Script for Any State

Objective: Write a bash script titled state.sh that:
1)	Extracts all the .rwl files for a state from the ITRDB using wget.
2)	Writes a text file named for that state (_WV_sites.txt_) that records the site names and the first line of the header of each file.

To run the command within the state.sh file we use:
```
bash state.sh state_abbrev #if you do not include a state, it will download the entire USA data.
```
This tells the computer to follow the commands that are within a file called state.sh. The commands are written as:
```
mkdir "$1"output
cd "$1"output
wget -r -e robots=off -A "$1"*.rwl -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

for state in *.rwl
do
ls $state | grep -v "noaa" *.rwl | head -n 1 $state >> $1.txt
done
```
The commands within the file create and enter a new working directory. The wget command downloads all of the files from a state in the NOAA website and places them inside the working folder. It then loops the .rwl files to list them, remove all files that include '-noaa', and isolates the header and first line of text for each of the data locations around the country. It then deposits the results in a separate textfile called 'output.'
.
