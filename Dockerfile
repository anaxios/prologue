FROM oven/bun:latest AS build
WORKDIR /app

COPY src           src
COPY .eleventy.js  .
COPY package.json  .

RUN bun install
RUN bun run eleventy

FROM build AS development

ENTRYPOINT ["bun", "run", "eleventy", "--serve", "--port", "3000"]

FROM oven/bun:latest AS production

WORKDIR /app

COPY --from=build /app/dist dist
COPY index.js .

EXPOSE 3000

ENTRYPOINT ["bun", "run", "index.js"]

#CMD sh -c 'while true; do sleep 10;done'


