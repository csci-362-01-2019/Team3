#!/bin/bash

# This is the script for running our project

passCount=0
failCount=0

#cd .. # cd to Main file structure

#TESTCASES=/test_cases/*
#for file in TESTCASES   # Main loop reading in files
#do  # Do for the Main loop
    for file in openaq-testing/*.txt; #for reading in contents 
    do
    echo "Running: $file"
        while IFS='\' read -r testNum testFile component nodeCMD oracle;  #change when get testCases
        # while to assign content to variables
        do
	    echo "$testNum" #testing
	    echo "$testFile" #testing
            echo "$testNum $testFile $units $nodeCMD $oracle"
        done <"$file"   # done for variable assignment
    done # done for reading in the file

echo "Test: $testNum"
echo "Testing File: $testFile"
$nodeCMD > testingOutputs.txt  #The node command has the needed textFile in it.
# grep testing........ 
if grep -q "$oracle" testingOutputs.txt;
    then passCount++ echo "Test passed"
#else
#    then failCount++ echo "Test failed"
fi
#done  # Done for the Main loop
