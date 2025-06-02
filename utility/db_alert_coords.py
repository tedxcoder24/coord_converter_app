# db_alter_coords.py

from pymongo import MongoClient, ASCENDING
from datetime import datetime

MONGO_URI = "mongodb+srv://<username>:<password>@<cluster-url>/test_coords?retryWrites=true&w=majority"

# Connect to MongoDB
client = MongoClient(MONGO_URI)
db = client["test_coords"]
collection_name = "coords_data"

def setup_coords_collection():
    if collection_name not in db.list_collection_names():
        db.create_collection(collection_name)
        print(f"Created collection: {collection_name}")

    coords_data = db[collection_name]
    coords_data.create_index([("lat", ASCENDING)])
    coords_data.create_index([("lng", ASCENDING)])
    print("Indexes created on 'lat' and 'lng'.")

def insert_sample_record():
    coords_data = db[collection_name]
    coords_data.insert_one({
        "lat": 27.9506,
        "lng": -82.4572,
        "notes": "Sample entry from db_alter_coords.py",
        "created_at": datetime.utcnow(),
        "updated_at": datetime.utcnow()
    })
    print("Sample record inserted.")

if __name__ == "__main__":
    setup_coords_collection()
    insert_sample_record()
