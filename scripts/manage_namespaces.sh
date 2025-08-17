#!/bin/bash

# script to apply or delete namespaces

# check command-line argument
if [ "$1" = "apply" ]; then
  echo "[INFO] Applying namespaces..."
  echo "[INFO] Applying argocd namespace..."
  kubectl apply -f ~/mnt/p3/k8s/argocd_namespace.yaml
  echo "[INFO] Applying dev namespace..."
  kubectl apply -f ~/mnt/p3/k8s/dev_namespace.yaml
  echo "[INFO] Namespaces applied."
  elif [ "$1" = "delete" ]; then
  echo "[INFO] Deleting namespaces..."
  echo "[INFO] Deleting dev namespace..."
  kubectl delete -f ~/mnt/p3/k8s/dev_namespace.yaml
  echo "[INFO] Deleting argocd namespace..."
  kubectl delete -f ~/mnt/p3/k8s/argocd_namespace.yaml
  echo "[INFO] Namespaces deleted."
else
  echo "[ERROR] Invalid argument. Usage: $0 {apply|delete}"
  exit 1
fi

