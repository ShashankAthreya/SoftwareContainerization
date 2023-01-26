# Software Containerisation
This repository is contains the code and images for the assignment of Software Containerisation

## Deployment

`make all`

## Testing

Run two port-forwards:

1. Backend: `kubectl port-forward service/todo-app-api 5000:5000 -n todo`

2. Frontend: `kubectl port-forward service/todo-app-ui 8080:8080 -n todo`