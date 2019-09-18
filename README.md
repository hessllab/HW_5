# Script To Retrieve Tree Ring data

This script downloads tree ring data for specified states in the USA from the NOAA's National Centers for Environmental Information database and organizes this information in a new directory called the abbreviation of the state. To check for files that have a header, this script also creates a text file and saves the name of each files in the state with the respective first line of the file.

## Prerequisites

To run this script `git bash` and `wget` is required

## Usage

Run the command below in the terminal to utilize the script.
The state_abbrev is the unique two letter abbreviation for states in the USA
```
bash state.sh state_abbrev
```

## Product
The script creates a new directory called the state abbreviation. 
for example; if the state is __West Virginia__, the name of the directory created will be __wv__

In this directory, the script stores all the retrieved .rwl files for that state.

Then the script produces a text file of site names followed by the first line (header) of the file:

```
wv001
020011  1796   107   100   107   131                                    
wv002
065031  1793   127   115   105   152   159   231   159                  
wv003
067011  1876   331   225   550   437
wv004
NERI   1 New River Gorge                                     PIVI               
wv005
CKMKBK 1 Cedar/Moser/Bible Knobs                             JUVI               
```

## Author

[Tobi Ore](https://github.com/tobi-ore)

## License

[This project is licensed under the MIT License](https://choosealicense.com/licenses/mit/)

## Acknowledgments

[Dr Amy Hessl](https://github.com/hessllab)
