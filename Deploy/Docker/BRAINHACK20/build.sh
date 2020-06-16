# Build and push Docker image that contains a release version of your
# Octave software using GitHub Actions.
#
#
# IMPORTANT! 
#   The version tag will be read from the version.txt file. 
#   For further details please see Dockerfile accompanying this file. 
#   Any changes to the Python and other dependencies should be described in the
#   accompanying apt.txt and requirements.txt configuration files. 
#
# Author: Agah Karakuzu 
# ==========================================================================

if [ -z "${GITHUB_WORKSPACE}" ]; then

    SRC_DIR=$1
    version=`cat $SRC_DIR/version.txt`
    DOCKER_USERNAME=$2
    DOCKER_PASSWORD=$3

else # User will pass qMRLab path 
    
    echo Starting build on Azure 
    SRC_DIR=$GITHUB_WORKSPACE
    version=`cat $SRC_DIR/version.txt`
    DOCKER_USERNAME=$DOCKER_USER # YOU NEED TO ADD TO THE GH SECRETS
    DOCKER_PASSWORD=$DOCKER_PASS # YOU NEED TO ADD TO THE GH SECRETS
fi

echo $version
USERNAME=agahkarakuzu
IMAGE=brainhack20

# Build docker image
cd $SRC_DIR/Deploy/Docker/BRAINHACK20
docker build -t $USERNAME/$IMAGE:$version -t $USERNAME/$IMAGE:latest --build-arg TAG=$version .

# PUSH
echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version
docker logout