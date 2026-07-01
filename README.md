# DriveMind

DriveMind is a collective vehicle intelligence system that enables vehicles to store, reason, and share driving experiences instead of raw sensor data.

Instead of every vehicle repeating the same road mistake, DriveMind allows vehicles to benefit from previous vehicle experiences.

---

## Core Idea

Traditional vehicle systems share raw data or basic alerts.

DriveMind shares compressed driving experience such as:

- high-risk road segments
- weather-specific near misses
- predicted vehicle intent
- explainable safety recommendations
- collective road intelligence graph

Example:

```text
Curve-42 has repeated near-miss events during rain.
Recommended action: reduce speed immediately and increase following distance.
```

---

## Current Project Status

The current MVP includes:

- React dashboard
- Node.js backend
- MongoDB telemetry storage
- MongoDB experience memory
- Python FastAPI AI service
- ML-based vehicle intent prediction
- Risk scoring engine
- Socket.IO realtime risk alerts
- Neo4j collective memory graph
- Graph overview API
- Docker Compose for MongoDB and Neo4j

---

## Tech Stack

### Frontend

```text
React
Vite
Tailwind CSS
Axios
Socket.IO Client
```

### Backend

```text
Node.js
Express
Socket.IO
MongoDB
Mongoose
Neo4j Driver
Axios
```

### AI Service

```text
Python
FastAPI
Scikit-learn
Pandas
NumPy
Joblib
Random Forest Classifier
```

### Databases

```text
MongoDB
Neo4j
```

### DevOps

```text
Docker
Docker Compose
GitHub
```

---

## System Architecture

```text
React Dashboard
        ↓
Node.js Backend API
        ↓
MongoDB
        ↓
Python FastAPI AI Service
        ↓
Risk Scoring Service
        ↓
Experience Memory
        ↓
Neo4j Collective Memory Graph
        ↓
Socket.IO Realtime Alert
        ↓
React Dashboard
```

---

## Main Features

### 1. Vehicle Telemetry Ingestion

Vehicles send telemetry data such as:

```text
speed
acceleration
brake pressure
steering angle
lane offset
distance to front vehicle
weather
road segment
```

Endpoint:

```http
POST /api/telemetry
```

---

### 2. AI Intent Prediction

The AI service predicts vehicle intent:

```text
brake
accelerate
turn_left
turn_right
lane_change
normal
```

Endpoint:

```http
POST /predict-intent
```

Example output:

```json
{
  "success": true,
  "predictedIntent": "brake",
  "confidence": 0.97
}
```

---

### 3. Risk Scoring

DriveMind calculates risk using:

- high speed
- sudden braking
- sharp turn at speed
- unsafe following distance
- bad weather

Example output:

```json
{
  "riskScore": 1,
  "riskLevel": "critical",
  "recommendedAction": "reduce_speed_immediately_and_increase_following_distance"
}
```

---

### 4. Experience Memory

If risk is high, DriveMind creates an experience memory.

Example:

```json
{
  "vehicleId": "vehicle_04",
  "roadSegmentId": "curve_42",
  "weather": "rain",
  "eventType": "high_speed_risk",
  "riskScore": 1,
  "confidence": 0.95
}
```

---

### 5. Neo4j Collective Memory Graph

DriveMind stores relationships like:

```text
Vehicle → EXPERIENCED → Experience
Experience → AT → RoadSegment
Experience → DURING → Weather
Experience → TYPE → Event
Experience → SUGGESTS → Action
```

Graph API:

```http
GET /api/graph
```

---

### 6. Realtime Risk Alerts

When a risky event occurs, Socket.IO emits:

```text
risk-alert
```

The frontend dashboard receives and displays the alert immediately.

---

## Local Setup

### 1. Clone the repository

```bash
git clone https://github.com/rags-git/DriveMind.git
cd DriveMind
```

---

### 2. Start databases

Make sure Docker Desktop is running.

Then run:

```bash
docker compose up -d
```

This starts:

```text
MongoDB: localhost:27017
Neo4j Browser: http://localhost:7474
Neo4j Bolt: bolt://localhost:7687
```

Neo4j login:

```text
Username: neo4j
Password: drivemind123
```

---

### 3. Start AI service

```bash
cd ai-service
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python data/generate_intent_data.py
python app/train_model.py
uvicorn app.main:app --reload --port 8000
```

AI service runs at:

```text
http://127.0.0.1:8000
```

---

### 4. Start backend

Open a new terminal:

```bash
cd backend
npm install
npm run dev
```

Backend runs at:

```text
http://localhost:5001
```

Health check:

```text
http://localhost:5001/api/health
```

---

### 5. Start frontend

Open a new terminal:

```bash
cd frontend
npm install
npm run dev
```

Frontend runs at:

```text
http://localhost:5173
```

---

## Environment Variables

Create this file:

```text
backend/.env
```

Add:

```env
PORT=5001
MONGO_URI=mongodb://localhost:27017/drivemind
AI_SERVICE_URL=http://127.0.0.1:8000
NEO4J_URI=bolt://localhost:7687
NEO4J_USERNAME=neo4j
NEO4J_PASSWORD=drivemind123
```

---

## API Endpoints

### Backend

```http
GET /api/health
POST /api/telemetry
GET /api/experiences
GET /api/experiences/road/:roadSegmentId
GET /api/road-risk/:roadSegmentId
GET /api/graph
```

### AI Service

```http
GET /health
POST /predict-intent
```

---

## Current Data Note

The current MVP AI model is trained on synthetic telemetry data.

This is used for:

- validating the ML pipeline
- testing backend-AI integration
- proving the end-to-end project flow

For the final advanced version, the model should be upgraded using:

1. CARLA-generated vehicle telemetry
2. Real-world trajectory-derived features

The project does not claim current synthetic model performance as real-world driving performance.

---

## Model Result

Current MVP model:

```text
Random Forest Classifier
```

Current synthetic dataset result:

```text
Accuracy: 98.40%
Macro F1-score: 0.97
Weighted F1-score: 0.98
```

---

## Project Vision

DriveMind changes the connected vehicle question from:

```text
How do vehicles share data?
```

to:

```text
How do vehicles share knowledge and experience?
```

The main innovation:

```text
Vehicles share experience, not raw data.
```

---

## Future Scope

- CARLA simulation integration
- Real-world trajectory dataset support
- Better graph queries
- Map-based vehicle visualization
- Authentication for dashboard users
- Dockerization of backend, frontend, and AI service
- Cloud deployment
- Advanced intent prediction models
- Explainable graph-based recommendations