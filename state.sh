#HW_5 Shell Script
#Dowloads wanted rwl files for any state and places into its own state directory
#Variable for state is $1


#Makes directory for a specific state and changes into that directory
mkdir "$1"
cd "$1"


#Downloads data using wget
wget -r -e robots=off -A "$1"*.rwl -R *noaa* -np -nH -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

#Loop that places sitename for each state and first line of each header into a text file
for sitename in "$1"*.rwl
do
  echo $sitename | cut -d '.' -f 1 >> "$1"_sites.txt
  head -n 1 $sitename >> "$1"_sites.txt
done

#usage bash state.sh wv (or multiple states)
