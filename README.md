# Team3

## OpenAQ Fetch

This is our project for our software engineering course at the College of Charelston. 

### System Requirements: 
* Windows, Mac, Linux system
* Approx 200MB of free disk space
* At least 1.8GB free memory
* 2 core CPU is recommended
* node.js >= 8.6
* Either of:
    * docker or
    * postgresql >= 10 with postgis >= 2 extensions.

### After cloning the repository 
Setup: First, open a terminal and navigate to Team3/TestAutomation/project
Install necessary Node.js packages by running

`npm install`

To run all test scripts:
In a terminal, navigate to Team3/TestAutomation, then run

`./scripts/runAllTests.sh`

This will run the first five test cases and display the results in a web page.
The first five test cases test the "parameter" field of the makeSourceFromData function.
