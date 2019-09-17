First, the script pulls all files from the database containing the state abbreviation input by the user:
```bash
wget -r -q -A "$1"*.rwl -R *noaa* -e robots=off -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
```
The `-R *noaa*` term excludes files whose names contain the string `noaa`, which are metadata.

Then, it iterates through all the downloaded files:
```bash
for file in *.rwl
do
```
Data regarding the files are recorded in a new text file, `"$1"_sites.txt`
First it records the filename, sans extension:
```bash
echo $file | cut -d "." -f 1 >> "$1"_sites.txt
```
Then it records the first line of the file:
```bash
head -n 1 $file >> "$1"_sites.txt
```
Once all files are recorded, the loop closes:
```bash
done
```

Example product, for Oklahoma: `ok_sites.txt`
```
ok
730--- 1 ARBUCKLE MOUNTAINS DB0421   TOTAL RING WIDTH                       D421
ok001
NEOSHO RIVER, OKLAHOMA  POST OAK RING WIDTHS (.01MM)
ok004
BLUESTEM LAKE, OKLAHOMA  POST OAK RING WIDTHS (.01MM)
ok007
KEY    1 Keystone Lake                                       QUST               
ok007e
KEY    1 Keystone Lake                                       QUST               
ok007l
KEY    1 Keystone Lake                                       QUST               
ok010
OAKWOOD, OKLAHOMA  POST OAK RING WIDTHS (.01MM)
ok013
CANADIAN RIVER, OKLAHOMA POST OAK RING WIDTHS (.01MM)
ok016
LAKE EUFAULA, OKLAHOMA  POST OAK RING WIDTHS (.01MM)
ok019
MCCURTAIN CO. WILDERNESS, OK  POST OAK RING WIDTHS (.01MM)
...
```
