mkdir "$1"
cd "$1"

wget -r -q -A "$1"*.rwl -R '*noaa*' -e robots=off -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

for filename in *.rwl
  do
    echo "$filename" | cut -d '.' -f 1 >> "$1"_sites.txt
    head -n 1 "$filename" >> "$1"_sites.txt
  done
  
