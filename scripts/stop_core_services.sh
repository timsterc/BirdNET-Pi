#!/usr/bin/env bash
# Restarts ALL services and removes ALL unprocessed audio


services=(birdnet_recording.service
birdnet_analysis.service
extraction.timer)

for i in  "${services[@]}";do
  sudo systemctl stop  ${i}
done
sudo rm -rf ${RECS_DIR}/$(date +%B-%Y/%d-%A)/*
