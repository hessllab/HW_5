### Homework 5
### Sara Schreder-Gomes
____________

### Requirements

1) Internet connection
2) Installation of Git Bash
3) Installation of wget

### Usage

The user will be able to pull and summarize data from one state of tree ring data at a time using the bash script:

`bash state.sh "state_abbrev"`

The state abbreviation will be two letters, in lowercase. The state abbreviation becomes the variable `$1` in the script. The script also aims to reduce clutter by creating a directory (ITRDB_by_state) to hold the individual state directories. The flag `-A` accepts the criteria immediately following, while the `-R` flag excludes certain criteria. Together, it allows us to pull the .rwl files of varying characters but not the -noaa.rwl files. 

```bash
mkdir -p ITRDB_by_state/"$1"
cd ITRDB_by_state/"$1"
wget -r -e robots=off -A "$1"'*.rwl' -R "$1"'*-noaa.rwl' -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
``` 



The loop below pulls information from the downloaded files. It pulls the sitename, cuts the extension using the period as a delimiter, and takes the first line of the file and pushes it to a text file that summarizes each states data. 

```bash
for sitename in "$1"*.rwl
do
  echo $sitename | cut -d '.' -f 1 >> "$1"_sites.txt
  head -n 1 $sitename >> "$1"_sites.txt
  echo  >> "$1"_sites.txt
done
```

### Products

The output of this loop is a text file that contains the sitename and the first row in the file. The first row may contain either a header including specific locaiton information, or no header. For example, the text file for Connecticut would be:

```
ct001
BIGELOW POND, CONNECTICUT -- EASTERN HEMLOCK                            

ct002
NF000   1800    54    49    47    49    44    47    84    89   104   153
```

### Resources

All data used for this script can be found online through NOAA, at: https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

 
