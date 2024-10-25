#!/bin/bash
#kubectl delete -f ./build
#kustomize build -o build --enable-helm
#kubectl apply -f ./build
helm uninstall db-connect
helm install db-connect ./charts/spring
