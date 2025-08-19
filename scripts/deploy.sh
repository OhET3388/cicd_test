#!/bin/bash
# Push to Docker Hub
docker tag cicd_test:latest mydockerhubusername/cicd_test:latest
docker push mydockerhubusername/cicd_test:latest

# Restart container with latest image
docker rm -f cicd_test_container || true
docker run -d -p 3000:3000 --name cicd_test_container mydockerhubusername/cicd_test:latest
# Make scripts executable:
chmod +x scripts/*.sh

