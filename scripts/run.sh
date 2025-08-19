#!/bin/bash
docker run -d -p 3000:3000 --name cicd_test_container cicd_test:latest

