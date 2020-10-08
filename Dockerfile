from debian:buster-slim

RUN apt-get update
RUN apt-get install apt-utils dirmngr ca-certificates -y

RUN gpg --keyserver pool.sks-keyservers.net --recv-key F8E3347256922A8AE767605B7808CE96D38B9201
RUN gpg --export '7808CE96D38B9201' | apt-key add -

COPY upmpdcli.list /etc/apt/sources.list.d/

RUN apt-get update
RUN apt-get install upplay -y

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.config/Upmpd.org

RUN chmod 777 /root
RUN chmod 777 -R /root/.config

ENV HOME=/root
ENV XDG_RUNTIME_DIR=/root

RUN echo "${HOME}"
RUN echo "${XDG_RUNTIME_DIR}"

CMD /usr/bin/upplay
