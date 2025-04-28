#!/bin/bash
set -e
cd /home/ec2-user/app
sudo docker build -t mi-app-flask .
echo "Docker image build completed."