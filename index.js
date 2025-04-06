import { Hono } from "hono";
import { logger } from "hono/logger";
import { serveStatic } from "hono/bun";

const app = new Hono();
app.use(logger());
app.use("*", serveStatic({ root: "./dist" }));
app.use("/favicon.ico", serveStatic({ path: "./dist/assets/logo.png" }));
// app.get("/", (c) => c.text("You can access: /static/hello.txt"));
// app.get("*", serveStatic({ path: "./dist/index.html" }));

export default app;

// const fs = require("fs").promises;

// const BASE_PATH = "dist";
// Bun.serve({
//   port: 3000,
//   async fetch(req) {
//     const pathname = new URL(req.url).pathname;
//     const stats = await fs.stat(BASE_PATH + pathname);

//     if (stats.isDirectory()) {
//       const filePath = BASE_PATH + pathname + "/index.html";
//       const file = Bun.file(filePath);
//       return new Response(file);
//     }
//     const filePath = BASE_PATH + pathname;
//     const file = Bun.file(filePath);
//     return new Response(file);
//   },
//   error() {
//     const file = Bun.file(BASE_PATH + "/index.html");
//     return new Response(file, { status: 404 });
//   },
// });
