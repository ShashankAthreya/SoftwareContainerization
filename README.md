# Software Containerisation
This repository is contains the code and images for the assignment of Software Containerisation 

## Frontend deployment

The first steps in deploying the frontend is complete. The frontend K8 files still needs to be converted to a helm chart.

Steps to deploy the frontend:

1. Deploy: `kubectl apply -f helm/frontend/templates/deployment.yaml -f helm/frontend/templates/service.yaml`

2. Create port-forward: `kubectl port-forward service/todo-app-ui 8080:8080`
   
3. Navigate to `localhost:8080`