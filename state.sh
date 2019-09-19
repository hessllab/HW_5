mkdir "$1"output
cd "$1"output
wget -r -e robots=off -A "$1"???.rwl -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
wget -r -e robots=off -A "$1"????.rwl -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
wget -r -e robots=off -A "$1"?????.rwl -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
wget -r -e robots=off -A "$1"??????.rwl -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

for filename in *.rwl
do
  ls "$filename" | cut -d . -f 1 $filename >> "$1"_sites.txt
  head -n 1 "$filename" >> "$1"_sites.txt
done
