#!/bin/bash
set -e
echo "Stopping any running Docker containers..."
# Stop and remove any running container with your image name (replace <your-docker-image-name>)
container_id=$(sudo docker ps -qf "ancestor=mi-app-flask")
if [ -n "$container_id" ]; then
  sudo docker stop "$container_id"
  sudo docker rm "$container_id"
  echo "Docker container stopped and removed."
else
  echo "No running Docker container found for mi-app-flask."
fi