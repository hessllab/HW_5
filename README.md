Just in case the .sh file I uploaded isn't visible to you, I have attached the loop inside of this link. [state.sh](./state.sh)

```
bash state.sh
```
This tells the computer to follow the command that is within a file called state.sh. The command within the file is a wget command that downloads the relevent data (not the metadata) from the NOAA website and places it in a new folder. It then loops the files to isolate the name and first line of text for each of the data locations around the country. It then deposits the results in a separate textfile.


The info below isn’t necessary, but I included it to let you know I tried creating a better code than the one I submitted.
```
wget -r -e robots=off -A "$1"*.rwl '-R "*-noaa.rwl"' -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
```
I had to use two 'wget' commands to extract the files with different numbers of characters. I tried my best to implement the 'reject' flag that you mentioned, however 'man grep' only told me what it did, not how to use it. Google was also less than helpful. The 'wget' I listed above does not work (it still lists the 'noaa' files), however it was the closest I could get to a command that would work. 
