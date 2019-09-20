mkdir "$1"output
cd "$1"output
wget -r -e robots=off -A "$1"*.rwl -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

for state in *.rwl
do
	ls $state | find data -name '*s.txt' | grep -v -noaa | head -n 1 $state >> output.txt
done
