//const { stat } = require("fs").promises;

const BASE_PATH = "./html";
Bun.serve({
  port: 3000,
  async fetch(req) {
    //console.log(`hit! ${new Date()}`);
    const pathname = new URL(req.url).pathname;
    if (pathname === "/") {
      const filePath = BASE_PATH + pathname + "index.html";
      const file = Bun.file(filePath);
      return new Response(file);
    }
    const filePath = BASE_PATH + pathname;
    const file = Bun.file(filePath);
    return new Response(file);
  },
  error() {
    return new Response(null, { status: 404 });
  },
});
