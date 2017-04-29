FROM alpine:latest

MAINTAINER Open Source Services [opensourceservices.fr]

RUN apk add --no-cache transmission-daemon

RUN mkdir -p /transmission/downloads \
  && mkdir -p /transmission/incomplete \
  && mkdir -p /etc/transmission-daemon

COPY src/ .

VOLUME ["/transmission/downloads"]
VOLUME ["/transmission/incomplete"]

EXPOSE 9091

ENV USERNAME admin
ENV PASSWORD password

RUN chmod +x /start-transmission.sh
CMD ["/start-transmission.sh"]
