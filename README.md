Just in case the .sh file I uploaded isn't visible to you, I have attached the loop inside of this link. [state.sh](./state.sh)

```
bash state.sh
```
This tells the computer to follow the command that is within a file called state.sh. The command within the file is a wget command that downloads the relevent data (not the metadata) from the NOAA website and places it in a new folder. It then loops the files to isolate the name and first line of text for each of the data locations around the country. It then deposits the results in a separate textfile.
