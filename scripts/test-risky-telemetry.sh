#!/bin/bash

echo "Sending risky telemetry to DriveMind backend..."

curl -X POST http://localhost:5001/api/telemetry \
-H "Content-Type: application/json" \
-d '{
  "vehicleId": "vehicle_test_01",
  "roadSegmentId": "curve_42",
  "speed": 78,
  "acceleration": -1.9,
  "brakePressure": 0.88,
  "steeringAngle": 25,
  "laneOffset": 0.5,
  "distanceToFrontVehicle": 5,
  "weather": "rain"
}'

echo ""