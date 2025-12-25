#!/bin/bash
# Railway startup script

# Use Railway's PORT environment variable or default to 8000
PORT=${PORT:-8000}

echo "Starting application on port $PORT"

# Start gunicorn with uvicorn workers
gunicorn src.api.main:app \
  --worker-class uvicorn.workers.UvicornWorker \
  --bind 0.0.0.0:$PORT \
  --workers 2 \
  --timeout 120 \
  --access-logfile - \
  --error-logfile -
