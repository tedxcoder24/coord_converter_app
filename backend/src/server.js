import Fastify from "fastify";
import cors from "@fastify/cors";
import dotenv from "dotenv";
import coordsRoutes from "./routes/coords.js";

dotenv.config();

const fastify = Fastify({ logger: true });

// Register CORS
await fastify.register(cors, {
  origin: "*",
});

// Register Routes
fastify.register(coordsRoutes, { prefix: "/api" });

// Start Server
const start = async () => {
  try {
    await fastify.listen({ port: 3000, host: "0.0.0.0" });
    console.log("Server running on http://localhost:3000");
  } catch (err) {
    fastify.log.error(err);
    process.exit(1);
  }
};

start();
