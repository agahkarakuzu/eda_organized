FROM qmrlab/octjn:latest
ADD . $HOME/work
COPY ./postBuild $HOME/work
RUN cd $HOME/work && \ 
    cat postBuild | while read in; do eval "$in"; done
WORKDIR $HOME/work
