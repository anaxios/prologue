FROM oven/bun:latest AS build
WORKDIR /app

COPY src src
COPY .eleventy.js .
COPY package.json .

RUN bun install
RUN bun run eleventy

FROM oven/bun:latest

WORKDIR /app

COPY --from=build /app/dist dist
COPY index.js .

EXPOSE 3000

ENTRYPOINT bun index.js

#CMD sh -c 'while true; do sleep 10;done'


