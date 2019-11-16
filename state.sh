#Shell Script with Loop Solution
#Downloads all the rwl data for a state in the USA into directory named for state
#$1 = state abbreviation
#Usage: itrdb_state.sh "wv"

#make a directory with the state name and cd into it
mkdir "$1"
cd "$1"

wget -r -e robots=off -A "$1"*.rwl -R *noaa* -np -nH -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/


for site in "$1"*.rwl
do
        echo $site | cut -d '.' -f 1 >> "$1"_sites.txt
        head -n 1 $site >> "$1"_sites.txt
done

paste - - < "$1"_sites.txt > "$1"_1line.txt
rm "$1"_sites.txt

#paste "$1"_names.txt "$1"_head.txt > "$1"_file.txt #another solution but makes more files

#move back up a directory in case another state is run.
cd ..
