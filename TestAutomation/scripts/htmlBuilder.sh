#!/bin/bash


readFile()
{
input="output.txt"
while IFS= read -r line
do
	echo "$line"
	echo "<br>"
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
</head>

<body><b>Test Results</b><br><br>  
 <table>
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
</body>
</html>
_EOF_
