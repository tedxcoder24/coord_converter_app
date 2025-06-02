import { MongoClient } from "mongodb";
import dotenv from "dotenv";

dotenv.config();

const MONGO_URI = process.env.MONGO_URI;
const DB_NAME = "test_coords";
const COLLECTION_NAME = "coords_data";

const client = new MongoClient(MONGO_URI);
await client.connect();
const db = client.db(DB_NAME);
const coordsCollection = db.collection(COLLECTION_NAME);

export default async function coordsRoutes(fastify, options) {
  fastify.post("/coords", async (request, reply) => {
    try {
      const { lat, lng, notes } = request.body;
      if (typeof lat !== "number" || typeof lng !== "number") {
        return reply.code(400).send({ error: "Invalid lat/lng format." });
      }

      const now = new Date();
      const doc = {
        lat,
        lng,
        notes: notes || "",
        created_at: now,
        updated_at: now,
      };

      const result = await coordsCollection.insertOne(doc);

      return reply.code(201).send({
        message: "Coordinates saved successfully.",
        id: result.insertedId,
      });
    } catch (err) {
      console.error(err);
      return reply.code(500).send({ error: "Failed to save coordinates." });
    }
  });
}
