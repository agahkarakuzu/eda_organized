# Dockerfiles are easy to manage, if you already have an image that did 
# the heavylifting for you. For running Octave by loading some packages 
# (e.g., image io struct), qmrlab/octjn:v2.4.0 can do that for you! 
FROM qmrlab/octjn:v2.4.0
# This image (qmrlab/octjn:v2.4.0) has the same Octave env with
# qmrlab/octaveci:v4.2.2 (we used for CI) + some Jupyter skills :)  We will
# use FROM command to set qmrlab/octjn:v2.4.0 as the foundation of the 
# environment in which we'll run our notebook.

# The following command will add the content of our repository 
# to the /home/jovyan/work directory. 
ADD . $HOME/work

# Navigate into the $HOME/work directory and execute the contents
# of postBuild script line by line.
RUN cd $HOME/work && \  
    cat ./binder/postBuild | while read in; do eval "$in"; done

# The postBuild script is going to download data from OSF (about 80MB). 
# Note that when included in a Docker image in this fashion, postBuild 
# actually becomes "intraBuild" and add the downloaded data in the Docker image.

# Normally I am not a big fan of Docker images coming with data baked in, but I 
# made an exception for this one, given that the data is not even 100MB. 

# Lastly, we will define $HOME/work as our work directory, where we 
# placed all the source code and where we'll find the data as well. 
WORKDIR $HOME/work
