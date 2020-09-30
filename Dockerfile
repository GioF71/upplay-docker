from debian:buster-slim

#COPY jf-at-dockes.org.pgp /root/

RUN apt-get update
RUN apt-get install apt-utils dirmngr ca-certificates -y

#RUN gpg --import /root/jf-at-dockes.org.pgp

#RUN gpg --export '7808CE96D38B9201' | apt-key add -

RUN gpg --keyserver pool.sks-keyservers.net --recv-key F8E3347256922A8AE767605B7808CE96D38B9201
RUN gpg --export '7808CE96D38B9201' | apt-key add -

COPY upmpdcli.list /etc/apt/sources.list.d/

RUN apt-get update
RUN apt-get install upplay -y

RUN rm -rf /var/lib/apt/lists/*

ENV UPPLAY_HOME_FOLDER=/config

#RUN mkdir ${UPPLAY_HOME_FOLDER}

RUN groupadd upplay -g 1024
RUN useradd -d ${UPPLAY_HOME_FOLDER} -s /bin/bash -m upplay -u 1024 -g 1024

USER upplay

ENV HOME=${UPPLAY_HOME_FOLDER}
#RUN echo "$HOME"

ENV XDG_RUNTIME_DIR=${UPPLAY_HOME_FOLDER}
RUN echo "$XDG_RUNTIME_DIR"

CMD /usr/bin/upplay
