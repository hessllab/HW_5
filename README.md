```
bash state.sh
```
This tells the computer to follow the command that is within a file called state.sh. The command within the file is a wget command that downloads all of the files from the NOAA website and places it in a new folder. It then loops the files to list them, remove all files that include '-noaa,' and isolate the name and first line of text for each of the data locations around the country. It then deposits the results in a separate textfile called 'output.'
