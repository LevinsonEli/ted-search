#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

url="$1"

max_attempts=5
attempt=0
sleep_interval=5

while [ $attempt -lt $max_attempts ]; do
  http_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")

  if [ "$http_code" -eq 200 ]; then
    break
  else
    echo "Retrying to test in $sleep_interval seconds..."
    sleep $sleep_interval
    ((attempt++))
  fi
done

if [ "$http_code" -eq 200 ]; then
  echo "Test 1: PASS: Server is up"
  exit 0
else
  echo "Test 1: FAIL: Server is down"
  exit 1
fi
