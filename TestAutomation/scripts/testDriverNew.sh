#!/bin/bash

# This is the script for running our project

arr=()
passCount=0
failCount=0

cd ..

for file in testCases/*.txt; #for reading in contents 
    do
    echo "Running: $file"
    i=0
        while IFS= read -r testFile;  #change when get testCases
        # while to assign content to variables
        do
	# Sorts text file into array
	    arr[$i]="$testFile"
	    i=$((i+1))
        done <"$file"   # done for variable assignment
	
	testNum=${arr[0]}
	jsonFile=${arr[1]}
	oracle=${arr[2]}
	echo $testNum
	echo $jsonFile
	echo $oracle > oracle.txt
	
	node project/index.js -d -s '$jsonFile' > testOutput.txt
	# node command into a file to be grepped and diffed
	
	# Grepping
	grep "$oracle" testOutput.txt > greppedOutput.txt
	
	DIFF=$(diff oracle greppedOutput.txt)
	if ["$DIFF" != ""]
	then 
		echo "An error has occured."
	fi

   done # done for reading in the file
