FROM jschueths/sshd 

MAINTAINER Josh Schueths <jschueths@gmail.com>

VOLUME ["/var/lib/transmission-daemon/info/torrents"]
VOLUME ["/var/lib/transmission-daemon/info/resume"]
VOLUME ["/var/lib/transmission-daemon/downloads"]

EXPOSE 9091
EXPOSE 51413

RUN apt-get update
RUN apt-get install -y transmission-daemon

RUN sed -i '/"rpc-whitelist": "127.0.0.1",/a "rpc-whitelist-enabled": false,' /etc/transmission-daemon/settings.json

ADD transmissiond.conf /etc/supervisor/conf.d/transmissiond.conf

ENV ADMIN_PASS transmission

# docker.io run \
#     -d \
#     -p PEER_PORT:51413 \
#     -p PEER_PORT:51413/udp \
#     -p RPC_PORT:9091 \
#     -p SSH_PORT:22 \
#     -e ADMIN_PASS=password \
#     -v /media:/var/lib/downloads \
#     jschueths/transmission

