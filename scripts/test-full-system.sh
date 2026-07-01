#!/bin/bash

echo "Testing DriveMind full system..."
echo ""

echo "1. Testing backend health..."
./scripts/test-backend-health.sh

echo ""
echo "2. Testing AI service health..."
./scripts/test-ai-health.sh

echo ""
echo "3. Testing risky telemetry flow..."
./scripts/test-risky-telemetry.sh

echo ""
echo "DriveMind full system test completed."