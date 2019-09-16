# states.sh
# Download all the .rwl files for a specified state from ITRDB website, and create a text file that contain site names and first line of each files.
# Usage: bash state.sh state_abbrev_in_lowercase
# Products: ./'state_abbrev'_directory/'state_abbrev'.rwl, 'state_abbrev'_sites.txt, 

wget -P ./"${1^^}"/ -r -e robots=off -A "$1"'*.rwl' -R '*-noaa.rwl' -np -nd "https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/"
for filename in "${1^^}"/*.rwl
do
echo $filename | cut -d / -f 2 | cut -d . -f 1 >> ./"${1^^}"/"${1^^}"_sites.txt && cat $filename | head -n 1 >> ./"${1^^}"/"${1^^}"_sites.txt
done