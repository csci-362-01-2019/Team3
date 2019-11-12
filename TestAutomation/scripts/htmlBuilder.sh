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
