FROM alpine AS apk
RUN apk update 
RUN apk add lowdown curl

FROM apk AS ssg
WORKDIR /app
RUN curl -OL https://romanzolotarev.com/bin/ssg
COPY ssg.sha512 .
RUN sha512sum -c ssg.sha512

FROM ssg AS build
WORKDIR /app

COPY markdown ./markdown
RUN mkdir html

RUN chmod +x ssg
RUN /app/ssg markdown/ html/ Prologue https://prologue.daedalist.net

FROM oven/bun:latest

WORKDIR /app

COPY index.js .
COPY --from=build /app/html ./html
COPY styles.css ./html
COPY assets ./html/assets

EXPOSE 3000

ENTRYPOINT bun index.js

#CMD sh -c 'while true; do sleep 10;done'


