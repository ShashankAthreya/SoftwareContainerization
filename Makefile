frontend:
	kubectl apply -f helm/frontend/templates/deployment.yaml -n todo
	kubectl apply -f helm/frontend/templates/service.yaml -n todo

backend:
	kubectl apply -f helm/backend/templates/deployment.yaml -n todo
	kubectl apply -f helm/backend/templates/service.yaml -n todo

redis:
	kubectl apply -f helm/database/templates/deployment.yaml -n todo
	kubectl apply -f helm/database/templates/service.yaml -n todo

all: frontend backend redis