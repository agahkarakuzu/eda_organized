dowloadLink=https://osf.io/9ptbr/download?version=2
echo $dowloadLink
wget -O $GITHUB_WORKSPACE/Test/testData.zip $dowloadLink 2>/dev/null || curl $dowloadLink --output $GITHUB_WORKSPACE/Test/testData.zip -O -J -L
unzip $GITHUB_WORKSPACE/Test/testData.zip -d Test
