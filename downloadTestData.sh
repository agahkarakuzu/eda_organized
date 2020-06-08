dowloadLink=https://osf.io/9ptbr/download?version=1
echo $dowloadLink
wget -O Test/testData.zip $dowloadLink 2>/dev/null || curl $dowloadLink --output $PWD/Test/testData.zip -O -J -L
unzip Test/testData.zip -d Test