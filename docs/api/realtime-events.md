# DriveMind Realtime Events

DriveMind uses Socket.IO to broadcast realtime safety alerts from the backend to connected dashboards or vehicle clients.

---

## 1. Socket.IO Server

Backend Socket.IO runs on the same server as the Express backend.

Local backend URL:

```text
http://localhost:5001
```

---

## 2. Connection Event

When a dashboard or vehicle connects, the backend logs:

```text
Vehicle/dashboard connected: <socket_id>
```

When it disconnects, the backend logs:

```text
Client disconnected: <socket_id>
```

---

## 3. Risk Alert Event

### Event Name

```text
risk-alert
```

### Purpose

This event is emitted when telemetry produces a high-risk or critical-risk driving situation.

A risk alert is emitted only when:

```text
riskScore >= 0.6
```

and an experience memory is created.

---

## 4. Example Event Payload

```json
{
  "type": "risk-alert",
  "vehicleId": "vehicle_04",
  "roadSegmentId": "curve_42",
  "weather": "rain",
  "riskLevel": "critical",
  "riskScore": 1,
  "predictedIntent": "brake",
  "intentConfidence": 0.98,
  "reasons": [
    "vehicle_speed_high",
    "sudden_braking_detected",
    "sharp_turn_at_speed",
    "unsafe_following_distance",
    "bad_weather_condition"
  ],
  "recommendedAction": "reduce_speed_immediately_and_increase_following_distance",
  "message": "High risk detected at curve_42. Recommended action: reduce_speed_immediately_and_increase_following_distance"
}
```

---

## 5. Frontend Listener Example

```js
import { io } from "socket.io-client";

const socket = io("http://localhost:5001");

socket.on("risk-alert", (alert) => {
  console.log("Risk alert received:", alert);
});
```

---

## 6. Current Realtime Flow

```text
Vehicle sends telemetry
        ↓
Backend stores telemetry
        ↓
Backend calls AI service
        ↓
AI predicts vehicle intent
        ↓
Backend calculates risk
        ↓
If riskScore >= 0.6
        ↓
Experience memory is stored
        ↓
Socket.IO emits risk-alert
        ↓
Dashboard receives realtime alert
```