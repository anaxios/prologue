FROM oven/bun:latest
WORKDIR /app
COPY index.js ./index.js
COPY html ./html
EXPOSE 3000
ENTRYPOINT bun index.js
