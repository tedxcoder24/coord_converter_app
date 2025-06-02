# Latitude and Longitude Converter App

This project is a **Flutter mobile app** that converts geographic coordinates from **Decimal Degrees (DD)** format to **Degrees, Minutes, Seconds (DMS)** format. It includes a backend built with **Fastify (Node.js)**, a **MongoDB Atlas** database, and a Python utility to set up the database.

---

## Features

- Input Latitude and Longitude in Decimal Degrees (DD)
- Convert DD to DMS format and display results
- Save converted coordinates to MongoDB Atlas via Fastify backend
- Optional Google Maps integration with marker display
- Organized Git workflow with `feature_coord_format_converter` branch and `main` branch
- Python utility script to create MongoDB database, collection, and indexes

---

## Tech Stack

| Layer             | Technology        |
| ----------------- | ----------------- |
| Frontend (Mobile) | Flutter           |
| Backend API       | Fastify (Node.js) |
| Database          | MongoDB Atlas     |
| Utility Script    | Python (pymongo)  |

---

## Project Structure

```
coord_converter_app/
├── frontend/ # Flutter mobile app
│ ├── lib/
│ ├── android/
│ ├── ios/
│ ├── .env
│ ├── pubspec.yaml
│ └── ...
├── backend/
│ ├── src/
│ ├── package.json
│ └── ...
└── python_utils/ # Python utility to setup MongoDB
├── db_alter_coords.py
└── requirements.txt
```

---

## How to Run

### 1. MongoDB Atlas

- Create an account on [MongoDB Atlas](https://www.mongodb.com/cloud/atlas).
- Create a free cluster.
- Whitelist your IP address.
- Create a database user with a username and password.
- Obtain your connection string (MongoDB URI).

---

### 2. Python Utility

- Navigate to `utility/`.
- Update the `MONGO_URI` variable inside `db_alter_coords.py` with your MongoDB URI.
- Install dependencies:

```bash
pip install -r requirements.txt
```

- Run the utility to create the database and collection with indexes:

```bash
python db_alter_coords.py
```

### 3. Backend Setup

- Navigate to the backend/ directory.
- Install dependencies:

```bash
npm install
```

- Create .env file with MongoDB URI:

```bash
MONGO_URI="your-mongodb-uri"
```

- Start the server:

```bash
node index.js
```

### 4. Flutter App Setup

- Navigate to frontend/.
- Create a .env file with the backend API URL:

```bash
API_BASE_URL=http://localhost:3000
```

- Install Flutter dependencies:

```bash
flutter pub get
```

- Run the app:

```bash
flutter run
```

- To build an APK:

```bash
flutter build apk --release
```
