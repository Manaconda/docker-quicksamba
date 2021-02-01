FROM alpine:latest

RUN apk add --no-cache --update \
    samba-common-tools \
    samba-client \
    samba-server
RUN mkdir /config /shared

VOLUME /config /shared

EXPOSE 137/udp 138/udp 139 445

CMD ["smbd", "--foreground", "--log-stdout", "--no-process-group", "--configfile=/config/smb.conf"]

