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
	#echo $oracle > oracle.txt
	#name="$jsonFile"
	#echo $name
	
	command="node project/index.js -d -s "
	command+="$jsonFile"
	#echo $command
	$command > testOutput.txt
	#output=(eval $command)
	#echo $output
	# node command into a file to be grepped and diffed
	#echo $oracle
	# Grepping
	#myCount=grep -c "$oracle" testOutput.txt
	if grep -F "$oracle" oracle.txt
		then
		  echo passed
		  passCount=$((passCount+1))
		  # code if found
	  else failCount=$((failCount+1))
	fi

   done # done for reading in the file
   echo $passCount tests passed
   echo $failCount tests failed
