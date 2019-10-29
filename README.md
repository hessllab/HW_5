###ITRDB Script for Any State

Objective: Write a bash script titled state.sh that:
1)	Extracts all the .rwl files for a state from the ITRDB using wget.
2)	Writes a text file named for that state (_WV_sites.txt_) that records the site names and the first line of the header of each file.

To run the command within the state.sh file we use:
```
bash state.sh
```
This tells the computer to follow the commands that are within a file called state.sh. The commands are written as:
```
wget -r -e robots=off -A '*.rwl' -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

for state in *.rwl
do
ls $state | grep -v "noaa" *.rwl | head -n 1 $state >> Output.txt
done
```
The commands within the file are a wget command that downloads all of the files from the NOAA website and places them inside the woring folder. It then loops the .rwl files to list them, remove all files that include '-noaa', and isolates the header and first line of text for each of the data locations around the country. It then deposits the results in a separate textfile called 'output.'
