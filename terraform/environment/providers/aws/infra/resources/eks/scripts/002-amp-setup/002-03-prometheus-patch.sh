#!/bin/bash -e

PROMETHEUS_CHART=prometheus
PROMETHEUS_NAMESPACE=observability
PROMETHEUS_VERSION=20.2.1

helm ls --all-namespaces

helm upgrade ${PROMETHEUS_CHART} prometheus-community/prometheus -n ${PROMETHEUS_NAMESPACE} -f prometheus-update-patch.yaml --version ${PROMETHEUS_VERSION}