#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
echo "Step 1: setting up docker id/path..."
dockerpath="angelodias/prediction"

# Step 2
# Run the Docker Hub container with kubernetes

echo "Step 2: Run the Docker Hub container with kubernetes..."
cat <<EOF > prediction-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: prediction
  labels:
    app: prediction
spec:
  containers:
  - image: ${dockerpath}
    name: prediction
    ports:
    - containerPort: 80
      protocol: TCP

EOF

kubectl create -f prediction-pod.yaml

# Step 3:
# List kubernetes pods
echo "Wait a few seconds..."
sleep 5
echo "Step 3 - List kubernetes pods"
kubectl get pods
# Step 4:
# Forward the container port to a host
echo "Step 4: Forward the container port to a host"

cat <<EOF > prediction-service.yaml
apiVersion: v1
kind: Service
metadata:
  name: prediction-service
spec:
  type: NodePort
  selector:
    app: prediction
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 80

EOF

kubectl create -f prediction-service.yaml

