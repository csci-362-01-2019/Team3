#!/bin/bash


readFile()
{
input="output.txt"
while IFS= read -r line
do
	echo "$line"
	#echo "<br>"
done < "$input"
}

buildTable()
{
arr=()
#input="output.txt"
#while IFS= read -r 
}

report()
{
for line in output.txt
do
	echo "<LI>$line<</LI>"
done
}

cat <<- _EOF_
<html>
<head>
  <title>
  Testing Report
  </title>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
}
tr:nth-child(even) {
  background-color: #99bbcf;
}
</style>
</head>

<body><b><center>Open-AQ Test Results</center></b><br><br>  
<p>	The testing script for OpenAQ builds a json data file from a template and the input from the test case file. This data file is then called by OpenAQ-fetch, which checks the sensor data contained within the json file to determine if it is valid input or not. If the input is valid, Fetch will update the database with the new data. If the input is not valid, then an error message is displayed and the data is not added to the database. The function being tested is function makeSourceFromData(data).</p>
<p>	<b>Data Source Criteria</b>

<br>Here is a list of the key criteria for air quality data aggregated onto the platform.

<br>(1) Data must be of one of these pollutant types: PM10, PM2.5, sulfur dioxide (SO2), carbon monoxide (CO), nitrogen dioxide (NO2), ozone (O3), and black carbon (BC).

<br>(2) Data must be from an official-level outdoor air quality source, as defined as data produced by a government entity or international organization. We do not include data from low-cost, temporary, and/or indoor sensors. 

<br>(3) Data must be ‘raw’ and reported in physical concentrations on their originating site. Data cannot be shared in an 'Air Quality Index' or equivalent (e.g. AQI, PSI, API) format.

<br>(4) Data must be at the ‘station-level,’ associable with geographic coordinates, not aggregated into a higher (e.g. city) level.

<br>(5) Data must be from measurements averaged between 10 minutes and 24 hours.
</p>
<br>
 <table id="myTable">
	<tr>
	<th>Test Number</th>
	<th>Test File</th>
	<th>Requirement</th>
	<th>Input</th>
	<th>Oracle</th>
	<th>Result</th>
	</tr>
    $(readFile)
</table>

<script>
function sortTable() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("myTable");
  switching = true;
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[0];
      y = rows[i + 1].getElementsByTagName("TD")[0];
      //check if the two rows should switch place:
      if (Number(x.innerHTML) > Number(y.innerHTML)) {
        //if so, mark as a switch and break the loop:
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
</script>

<script>
sortTable();
</script>

</body>
</html>
_EOF_
