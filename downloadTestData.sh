dowloadLink=https://osf.io/9ptbr/download?version=3
if [ -z "${GITHUB_WORKSPACE}" ]; then
echo Downloading data locally
wget -O $PWD/Test/testData.zip $dowloadLink 2>/dev/null || curl $dowloadLink --output $PWD/Test/testData.zip -O -J -L
unzip $PWD/Test/testData.zip -d Test
else
echo Downloading data GitHub Actions
wget -O $GITHUB_WORKSPACE/Test/testData.zip $dowloadLink 2>/dev/null || curl $dowloadLink --output $GITHUB_WORKSPACE/Test/testData.zip -O -J -L
unzip $GITHUB_WORKSPACE/Test/testData.zip -d Test
fi


