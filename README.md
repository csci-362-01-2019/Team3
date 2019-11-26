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

### Testing Description
   The testing script for OpenAQ builds a json data file from a template and the input from the test case file. This data file is then called by OpenAQ-fetch, which checks the sensor data contained within the json file to determine if it is valid input or not. If the input is valid, Fetch will update the database with the new data. If the input is not valid, then an error message is displayed and the data is not added to the database. The function being tested is function makeSourceFromData(data).

### Data Source Criteria
Here is a list of the key criteria for air quality data aggregated onto the platform.
(1) Data must be of one of these pollutant types: PM10, PM2.5, sulfur dioxide (SO2), carbon monoxide (CO), nitrogen dioxide (NO2), ozone (O3), and black carbon (BC).
(2) Data must be from an official-level outdoor air quality source, as defined as data produced by a government entity or international organization. We do not include data from low-cost, temporary, and/or indoor sensors.
(3) Data must be ‘raw’ and reported in physical concentrations on their originating site. Data cannot be shared in an 'Air Quality Index' or equivalent (e.g. AQI, PSI, API) format.
(4) Data must be at the ‘station-level,’ associable with geographic coordinates, not aggregated into a higher (e.g. city) level.
(5) Data must be from measurements averaged between 10 minutes and 24 hours. 
