#!/bin/bash

# This is the script for running our project

passCount=0
failCount=0

cd .. # cd to Main file structure

TESTCASES=/testCases/*
for file in TESTCASES   # Main loop reading in files
do  # Do for the Main loop
    for test#.txt in TESTCASES #for reading in contents 
    do
    echo "Running: $file"
        while IFS='\n' read -r test# testFile units nodeCMD oracle;  #change when get testCases
        # while to assign content to variables
        do
            echo "$testNum $testFile $units $nodeCMD $oracle"
        done <"$file"   # done for variable assignment
    done # done for reading in the file

echo "Test: $testNum"
echo "Testing File: $testFile"
./$nodeCMD >> testingOutputs.txt  #The node command has the needed textFile in it.
# grep testing........ 
if grep -q "$oracle" testingOutputs.txt;
    then passCount++ echo "Test passed"
else
    then failCount++ echo "Test failed"
fi
done <$1  # Done for the Main loop