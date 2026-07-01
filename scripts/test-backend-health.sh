#!/bin/bash

echo "Testing DriveMind backend health..."

curl http://localhost:5001/api/health

echo ""