# DriveMind Demo Script

## Opening

This is DriveMind, a collective memory and intent prediction system for intelligent vehicles.

The main idea is that vehicles should not only react using their own sensors, but should also learn from previous risky experiences shared by other vehicles.

---

## Problem

Most intelligent vehicle systems make decisions locally.

If one vehicle experiences sudden braking on a dangerous curve, another vehicle may later enter the same road segment without knowing that risk.

DriveMind solves this by storing risky driving situations as structured experience memory.

---

## Demo Flow

First, I start MongoDB and Neo4j using Docker.

Then I start the AI service, backend, and frontend dashboard.

On the dashboard, I send risky vehicle telemetry.

The backend sends telemetry features to the AI service.

The AI predicts the vehicle intent as braking.

The risk engine detects a critical risk.

The system creates an experience record in MongoDB.

It also creates graph memory in Neo4j.

Finally, the dashboard receives a real-time risk alert using Socket.IO.

---

## Closing

DriveMind shows a complete pipeline from telemetry input to AI prediction, risk scoring, memory creation, graph reasoning, and real-time visualization.

The current version is an MVP using synthetic data, and future versions can integrate CARLA simulation or real-world vehicle trajectory datasets.