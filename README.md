
[state.sh](./state.sh)

Just in case the .sh file I uploaded isn't visible to you, I have attached the loop inside of this link.




```
wget -r -e robots=off -A '*.rwl' -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
```
This command gathers all of the data from the NOAA website.

```
bash state.sh $@
```
This tells the computer to follow the command that is within a shapefile called state.sh. The command within the shapefile is a loop (see below) isolates the name and first line of text for each of the data locations around the country. It then deposits the results in a separate textfile called state_output.txt.

```
for state in *.rwl
do
	ls $state | cut -d . -f 1 $state | head -n 1 $state >> state_output.txt
done
```
