# DriveMind Backend API Documentation

Base URL:

```text
http://localhost:5001
```

---

## 1. Health Check API

### Endpoint

```http
GET /api/health
```

### Purpose

Checks whether the backend server is running correctly.

### Response

```json
{
  "status": "ok",
  "service": "DriveMind Backend",
  "message": "Backend health check passed"
}
```

---

## 2. Telemetry Ingestion API

### Endpoint

```http
POST /api/telemetry
```

### Purpose

Receives live vehicle telemetry, stores it in MongoDB, calculates risk, and creates an experience memory if risk is high.

### Request Body

```json
{
  "vehicleId": "vehicle_02",
  "roadSegmentId": "curve_42",
  "speed": 72,
  "acceleration": -1.6,
  "brakePressure": 0.82,
  "steeringAngle": 22,
  "laneOffset": 0.41,
  "distanceToFrontVehicle": 7,
  "weather": "rain"
}
```

### Response

```json
{
  "success": true,
  "message": "Telemetry stored successfully",
  "data": {
    "telemetry": {},
    "risk": {
      "riskScore": 1,
      "riskLevel": "critical",
      "reasons": [
        "vehicle_speed_high",
        "sudden_braking_detected",
        "sharp_turn_at_speed",
        "unsafe_following_distance",
        "bad_weather_condition"
      ],
      "events": [
        "high_speed_risk",
        "sudden_braking",
        "sharp_turn_risk",
        "near_miss"
      ],
      "recommendedAction": "reduce_speed_immediately_and_increase_following_distance",
      "confidence": 0.95
    },
    "experienceCreated": true,
    "experience": {}
  }
}
```

---

## 3. Get All Experience Memories

### Endpoint

```http
GET /api/experiences
```

### Purpose

Returns latest stored driving experiences.

### Response

```json
{
  "success": true,
  "count": 1,
  "data": []
}
```

---

## 4. Get Experiences by Road Segment

### Endpoint

```http
GET /api/experiences/road/:roadSegmentId
```

### Example

```http
GET /api/experiences/road/curve_42
```

### Purpose

Returns all stored risky experiences for a specific road segment.

---

## 5. Road Risk Summary API

### Endpoint

```http
GET /api/road-risk/:roadSegmentId
```

### Example

```http
GET /api/road-risk/curve_42
```

### Purpose

Calculates the overall risk of a road segment using past experience memories.

### Response

```json
{
  "success": true,
  "roadSegmentId": "curve_42",
  "riskLevel": "critical",
  "riskScore": 1,
  "experienceCount": 1,
  "mostCommonEvent": "high_speed_risk",
  "latestReason": "vehicle_speed_high, sudden_braking_detected, sharp_turn_at_speed, unsafe_following_distance, bad_weather_condition",
  "recommendation": "reduce_speed_immediately_and_increase_following_distance",
  "confidence": 0.95
}
```

---

## Current Backend Flow

```text
Vehicle telemetry
        ↓
Telemetry API
        ↓
MongoDB telemetry storage
        ↓
Risk scoring service
        ↓
Experience memory creation
        ↓
Road risk summary API
```