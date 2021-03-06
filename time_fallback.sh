#!/bin/bash

# This script is purly used for testing boot times of KumuluzEE applications.
#
# Script will meassure boot times and write them into a list. List will be deleted afterward.
# Boot times are than sumed and devided with their count.
# Result is appended as a single number to the file named below.

# --------------------------------------------------- #
# Script configurations                                                #
# --------------------------------------------------- #

# How many times should application run
numOfRuns=100

# Names of files created during script execution (tmp files are automatically removed)
tmp_log="time_tests/tmp_log.txt"
tmp_time="time_tests/tmp_time.txt"
tmp_times="time_tests/tmp_times_list.txt"
result_file="time_tests/time_result.txt"

# Delete list of times saved during script execution
delete_tmp_times=false

# --------------------------------------------------- #
# --------------------------------------------------- #

# Execution time
time_start=$(date +%s.%N)

# Generate fallback native image
native-image --force-fallback -cp api/target/classes:api/target/dependency/* com.kumuluz.ee.EeApplication graalvm-basic

# Kill application if it is already running
pkill -f 'graalvm'

# Create temporary file where extracted times will be saved
echo -n "" > $tmp_times

for (( i = 0; i < $numOfRuns; i++ ))
do

	# Run java application in background and write log into temporary file
	./graalvm-basic > $tmp_log &

	sleep 1

	# Create temporary file where extracted time will be saved
	echo -n "" > $tmp_time

	# Wait until time is extracted from logs
	while [[ $(cat $tmp_time) == "" ]]
	do
		# Extract time from log and write it into temporary file
		grep "Started @" $tmp_log | cut -d "@" -f 2 | cut -d "m" -f 1 > $tmp_time
		sleep 1
	done

	# Append result time
	cat $tmp_time >> $tmp_times

	# Kill running java application
	pkill -f 'graalvm'

	# Remove temporary files
	rm $tmp_time
	rm $tmp_log

done

# Sum values in temproray file tmp_times
sum_times=$( paste -sd+ $tmp_times | bc )

# Devide sum with number of runs
aprox=$(echo "$sum_times/$numOfRuns" | bc)

# Remove temporary file containing times for each run
if $delete_tmp_times
then
	rm $tmp_times
fi

# Meassure script execution time
time_stop=$(date +%s.%N)
time=$(echo "$time_stop - $time_start" | bc)

# Print results
echo "Runs:  $numOfRuns" >> $result_file
echo "Runs:  $numOfRuns"
echo "Time:  $time s" >> $result_file
echo "Time:  $time s"
echo "Aprox: $aprox ms" >> $result_file
echo "Aprox: $aprox ms"
echo "Results are appended in \"$result_file\" file."
echo "---------------------------------------------------" >> $result_file
