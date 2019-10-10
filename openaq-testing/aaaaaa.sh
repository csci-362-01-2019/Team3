cd ~
cd Desktop/test_cases
for entry in $PWD/*
do
	echo $entry
	while entry= read -r line
	do 
		echo "$line"		
	done < "$entry"
done
