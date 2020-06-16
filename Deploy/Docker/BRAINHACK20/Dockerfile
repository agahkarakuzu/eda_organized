FROM qmrlab/octjn:v2.4.0

RUN cd $HOME/work && \
    git clone --recursive https://github.com/agahkarakuzu/eda_organized.git && \
    cd eda_organized && \
    cat ./binder/postBuild | while read in; do eval "$in"; done

WORKDIR $HOME/work