### Homework 5

In attached .sh file, and shown below, is a bash script that allows you to pull the site data for any state in the ITRDB. First, all data is pulled using wget for a given state based on it's given abbreviation. Then all .rwl files are passed into a for loop, cut using a period as the delimiter and written to a textfile. Lastly, the first line of the .rwl file is written to the textfile. 

```bash
wget -r -e robots=off -A $@'.rwl' -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
wget -r -e robots=off -A $@'?.rwl' -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
wget -r -e robots=off -A $@'??.rwl' -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
wget -r -e robots=off -A $@'???.rwl' -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
wget -r -e robots=off -A $@'????.rwl' -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

for files in *.rwl
  do
  echo "$files" | cut -d '.' -f 1 >> $@_sites.txt
  head -n 1 $files >> $@_sites.txt
done
```
