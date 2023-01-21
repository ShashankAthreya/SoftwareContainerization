# Software Containerisation
This repository is contains the code and images for the assignment of Software Containerisation 

## Backend deployment

The first steps in deploying the backend is complete. The frontend K8 files still needs to be converted to a helm chart.

Steps to deploy the backend:

1. Build image: docker build -t todo-app-api:1.0.0 backend

2. Deploy: kubectl apply -f helm/frontend/templates/deployment.yaml -f helm/frontend/templates/service.yaml
