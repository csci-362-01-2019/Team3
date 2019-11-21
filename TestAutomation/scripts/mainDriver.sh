#!/bin/bash

# This is the script for running our project

arr=()
passCount=0
failCount=0

#cd ..

for file in testCases/*.txt; #for reading in contents 
    do
    #echo "Running: $file"
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
	input=${arr[3]}
	requirement=${arr[4]}
	echo "<tr>"
	echo "<td>"$testNum"</td>"
	echo "<td>"$jsonFile"</td>"
	echo "<td>"$requirement"</td>"
	echo "<td>"$input"</td>"
	echo "<td>"$oracle"</td>"
	echo $oracle > oracle.txt
	#name="$jsonFile"
	#echo $name
	#cd ..
	echo "
[
  {
    \"url\": \"https://www.openaq.org/\",
    \"adapter\": \"dummy\",
    \"name\": \"test\",
    \"location\": \"Test\",
    \"city\": \"Test\",
    \"country\": \"TS\",
    \"description\": \"Test\",
    \"sourceURL\": \"https://www.openaq.org/\",
    \"contacts\": [\"info@openaq.org\"],
    \"active\": false,
    \"data\": [
"$input"
    ],
    \"mobile\": false,
    \"sourceType\": \"government\",
    \"attribution\": [{\"name\": \"test\", \"url\": \"http://foo.com\"}],
    \"averagingPeriod\": {\"value\": 1, \"unit\": \"hours\"}
  }
]" > project/sources/test1.json
	

	
	#This builds the terminal command to run the specified file	
	command="node project/index.js -d -s "
	command+="test"
	#command+="$jsonFile"
	#echo $command
	$command > testOutput.txt
	#output=(eval $command)
	#echo $output
	# node command into a file to be grepped and diffed
	#echo $oracle
	# Grepping
	#myCount=grep -c "$oracle" testOutput.txt
	if grep -q -F "$oracle" testOutput.txt
	then
		  echo "<td>passed</td></tr>"
		  passCount=$((passCount+1))
		  # code if found
	else 
		  echo "<td>failed</td></tr>"
		  failCount=$((failCount+1))
	fi

   done # done for reading in the file
#   echo $passCount tests passed
#   echo $failCount tests failed
