# myList - A script to produce an HTML file of file names

pwd='pwd'

fileList()
{
for entry in $PWD/*
do
	echo "<LI>$entry</LI>"
done
}

cat <<- _EOF_
<html>
<head>
  <title>
  Files in current directory:
  </title>
</head>

<body>  
  <UL>
    $(fileList)
  </UL>
</body>
</html>
_EOF_
