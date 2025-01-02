#!/bin/bash


set -e


NAMESPACE="kube-prometheus-stack"


echo "Adding Prometheus Helm repository..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts


echo "Updating Helm repositories..."
helm repo update


echo "Installing kube-prometheus-stack in the '$NAMESPACE' namespace..."
helm install kube-prometheus-stack \
  --create-namespace \
  --namespace $NAMESPACE \
  prometheus-community/kube-prometheus-stack


echo "Forwarding Prometheus service to localhost:9090..."
kubectl port-forward -n $NAMESPACE svc/kube-prometheus-stack-prometheus 9090:9090 &


echo "Forwarding Grafana service to localhost:8080..."
kubectl port-forward -n $NAMESPACE svc/kube-prometheus-stack-grafana 8080:80 &

echo "Installation and port-forwarding complete."
echo "Access Prometheus at http://localhost:9090"
echo "Access Grafana at http://localhost:8080"
echo "Default Grafana credentials:"
echo "Username: admin"
echo "Password: prom-operator"

