./scripts/mainDriver.sh > output.txt
./scripts/htmlBuilder.sh > report.html
URL="report.html"
xdg-open $URL
