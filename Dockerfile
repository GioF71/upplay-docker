from library/debian:bullseye-20220125-slim

RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install apt-utils dirmngr ca-certificates -y

RUN mkdir -p /app/keyring
RUN wget https://www.lesbonscomptes.com/pages/lesbonscomptes.gpg -O /usr/share/keyrings/lesbonscomptes.gpg

COPY upmpdcli-bullseye.list /etc/apt/sources.list.d/

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
