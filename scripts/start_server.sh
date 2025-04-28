#!/bin/bash
set -e
cd /home/ec2-user/app
# Run the Docker container in the background, mapping port 5000
sudo docker run -d -p 5000:5000 mi-app-flask
fi