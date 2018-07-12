FROM alpine
LABEL maintainer="Julian Pawlowski <julian.pawlowski@gmail.com>"

ENV TERM xterm

RUN apk add --no-cache --virtual .run-deps \
bash \
busybox-extras \
expect \
openssh \
perl

RUN sed -i s,root,fhem,g /etc/passwd
RUN sed -i s,^fhem.*,fhem:*:0:0::/root:/bin/ash,g /etc/passwd
RUN sed -i s,root,fhem,g /etc/group
RUN sed -i s,root,fhem,g /etc/shadow
RUN echo "" > /etc/motd

EXPOSE 22
CMD ["/etc/ssh/start.sh"]
