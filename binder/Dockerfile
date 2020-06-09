FROM qmrlab/octjn:latest
ADD . $HOME/work
RUN cd $HOME/work && \  
    cat ./binder/postBuild | while read in; do eval "$in"; done
WORKDIR $HOME/work
