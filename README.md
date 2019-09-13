### ITRDB Script for Any State

Problem: Now that Cynthia has her script working for WV, she wants to globalize it so that she can run it for any state with data in the ITRDB. She still wants all the same outputs, but wants them to be named for the state so that when she runs the script for multiple states, each set of files will be unique.

Objective: Write a bash script titled state.sh that:
1)	Extracts all the .rwl files for a state from the ITRDB using wget.
2)	Writes a text file named for that state (_WV_sites.txt_) that records the site names and the first line of the header of each file.  Remember, some sites don't have a header so that line might be junk - (she wanted to know which have decent headers and which don't).

_Hint:_
Usage: bash state.sh state_abbrev  
Products: 'state_abbrev'_sites.txt, 'state_abbrev'/ directory containing rwl files for that state
 
Follow the following principles:
1)	Be sure to make the paths relative so that I can reproduce the structure on my machine simply by running your code.  
2)	In addition to a README.md explaining how the script works, you should now include a separate .sh file that can be run from command line.  
3)	Excellent scripts will create clean directories with only those files needed at the end.  
4)	The parsimonious the code, the better the answer. Edit your answer until only what is required is present. 

#### Submit using the fork-clone-branch-commit-pull_request strategy.

