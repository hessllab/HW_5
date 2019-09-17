for state in *.rwl
do
	ls $state | cut -d . -f 1 $state | head -n 1 $state >> state_output.txt
done