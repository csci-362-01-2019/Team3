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

report()
{
for line in output.txt
do
	echo "<LI>$line</LI>"
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
  
    $(readFile)
  
</body>
</html>
_EOF_
