#!/bin/bash

# This is the script for running our project

passCount=0
failCount=0

cd ..

#TESTCASES=/test_cases/*
#for file in TESTCASES   # Main loop reading in files
#do  # Do for the Main loop
    for file in testCases/*.txt; #for reading in contents 
    do
    echo "Running: $file"
        while IFS='\' read -r testNum testFile  oracle;  #change when get testCases
        # while to assign content to variables
        do
            echo "$testNum $testFile $oracle"
	     
        cd project
	
	node index.js -d -s \'"$testFile"\' > testOutput.txt
	if grep -q "$oracle" testOutput.txt
   	 then
	    let  passCount++
	    echo "Test passed"
	#else
	#    then failCount++ echo "Test failed"
	fi
	cd ..
	done <"$file" # done for variable assignment

    done # done for reading in the file

#echo "Test: $testNum"
#echo "Testing File: $testFile"
#$nodeCMD > testingOutputs.txt  #The node command has the needed textFile in it.
# grep testing........ 
echo $passCount
#done  # Done for the Main loop
