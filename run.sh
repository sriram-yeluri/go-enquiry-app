#!/bin/sh
VERSION=1.0.0

# Clean Docker Image
docker rmi enquiry-app:${VERSION}

# Build Docker Image
docker build -t enquiry-app:${VERSION} .

# Deploy enquiry-app using Helm chart
cd helm-context
helm upgrade --install enquiry ./enquiry --values ./enquiry/values.yaml --namespace asteroid-herder --create-namespace

# Delete enquiry app from the cluster
# helm uninstall enquiry
