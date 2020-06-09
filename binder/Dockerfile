FROM qmrlab/octjn:latest
ADD . $HOME/work
COPY postBuild /tmp/
RUN cat /tmp/postBuild | while read in; do eval "$in"; done
WORKDIR $HOME/work
