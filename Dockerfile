from debian:buster-slim

RUN apt-get update
RUN apt-get install apt-utils dirmngr ca-certificates -y

RUN gpg --keyserver pool.sks-keyservers.net --recv-key F8E3347256922A8AE767605B7808CE96D38B9201
RUN gpg --export '7808CE96D38B9201' | apt-key add -

COPY upmpdcli.list /etc/apt/sources.list.d/

RUN apt-get update
RUN apt-get install upplay -y

RUN rm -rf /var/lib/apt/lists/*

ENV UPPLAY_HOME_FOLDER=/config

RUN groupadd upplay -g 1024
RUN useradd -d ${UPPLAY_HOME_FOLDER} -s /bin/bash -m upplay -u 1024 -g 1024

USER upplay

RUN mkdir -p "${UPPLAY_HOME_FOLDER}/.config/Upmpd.org"

ENV HOME=${UPPLAY_HOME_FOLDER}
ENV XDG_RUNTIME_DIR=${UPPLAY_HOME_FOLDER}

RUN echo "${HOME}"
RUN echo "${XDG_RUNTIME_DIR}"

CMD /usr/bin/upplay
