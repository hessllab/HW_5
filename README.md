# state.sh
## Download All .rwl Files for a State from NOAA NCEI

The attached script "state.sh" can be used to download Tree Ring Data from NOAA's Database. The users only needs to input the initials of the State that she wants to download. 

## Requirements
- Connection to internet. 
- Instalation of Git Bash. 
- Instalation of `wget`. 
- Enough space to save files in the selected directory.

## Usage

To run the file the user should open the Bash terminal and input the following code
```{Bash}
bash state.sh $1
```
Where ```$1``` refers to the initial in lowercase letters of the State that is to be downloaded (e.g. ny for New York, or wv for West Virginia). 

## Product
 1) The creation of a folder named after the initials of the state inputted. The folder will be located in the directory where the state.sh script is located. 
2) Donwloading all the ```.rwl``` files with data from that State, except files containing the word "noaa".
3) A text file named after the state abbreviation followed by "sites". The text file will list all the downloaded file names without their extention and a line that includes (but not in every case) the site where the data was collected.  
