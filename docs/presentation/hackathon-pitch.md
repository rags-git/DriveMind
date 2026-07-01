# DriveMind Hackathon Pitch

## One-Line Pitch

DriveMind is a collective memory and intent prediction system that helps intelligent vehicles learn from risky driving experiences and warn future vehicles in real time.

---

## Problem

Most intelligent vehicle systems make decisions using only their own sensors and current surroundings.

This means every vehicle has to discover road risks independently.

For example:

- One vehicle may face sudden braking on a dangerous curve.
- Another vehicle may later enter the same road segment without knowing that risk.
- Useful driving experiences are lost instead of being shared.

---

## Solution

DriveMind converts risky vehicle situations into structured driving experiences.

Instead of sharing raw sensor data, it stores useful safety knowledge such as:

- Risky road segment
- Weather condition
- Vehicle behavior
- Risk reason
- Recommended action

This creates a shared memory system for intelligent vehicles.

---

## How It Works

1. Vehicle telemetry is sent to the backend.
2. AI service predicts vehicle intent.
3. Risk engine calculates danger level.
4. High-risk events are stored in MongoDB.
5. Relationships are stored in Neo4j graph memory.
6. Dashboard receives real-time alert using Socket.IO.

---

## Demo Flow

1. Start databases.
2. Start AI service.
3. Start backend.
4. Start frontend.
5. Open dashboard.
6. Click `Send Risky Vehicle Telemetry`.
7. Show:
   - AI predicted intent
   - Critical risk score
   - Experience created
   - Graph memory created
   - Real-time alert

---

## Tech Stack

- React
- Node.js
- Express.js
- FastAPI
- Scikit-learn
- MongoDB
- Neo4j
- Socket.IO
- Docker

---

## Current MVP

The current version demonstrates the full pipeline:

Telemetry → AI prediction → Risk scoring → Experience memory → Graph memory → Real-time dashboard

The AI model currently uses synthetic data for demonstration.

---

## Future Scope

- CARLA simulator integration
- Real-world vehicle trajectory datasets
- Map-based road risk visualization
- Vehicle-to-vehicle recommendation system
- Route risk prediction
- Cloud deployment