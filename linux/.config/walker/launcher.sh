#!/bin/bash

# omarchy:summary=Launch Walker and ensure its Elephant data provider is running

if ! pgrep -x elephant > /dev/null; then
  echo "Launching Elephant..."
  setsid app2unit -- elephant &
fi

# Ensure walker service is running
if ! pgrep -f "walker --gapplication-service" > /dev/null; then
  echo "Launching Walker..."
  setsid app2unit -- env GSK_RENDERER=cairo walker --gapplication-service &
fi

exec app2unit -- walker --width 644 --maxheight 300 --minheight 300 "$@"
