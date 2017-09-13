FROM alpine
MAINTAINER Jarrett Irons <jarrett.irons@gmail.com>

ENV PORT 8080
ENV RESPONSE_CODE 200
ENV RESPONSE_MESSAGE OK

RUN apk update \
  && apk add --no-cache netcat-openbsd gettext\
  && rm -rf /var/cache/apk/* 

EXPOSE $PORT

COPY nc.template /tmp/nc.template

#CMD bundle exec puma -e development -p $PORT -s ./tmp/puma.state -t 4:40 -w 4
#CMD envsubst < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
CMD envsubst < /tmp/nc.template > /tmp/nc.txt && \
while true; do cat /tmp/nc.txt | nc -l  ${PORT}; done
