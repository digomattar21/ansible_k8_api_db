minikube start
kubectl apply -f webapp-deployment.yaml
kubectl apply -f webapp-service.yaml
kubectl apply -f db-deployment.yaml
kubectl apply -f db-service.yaml
minikube service webapp-service