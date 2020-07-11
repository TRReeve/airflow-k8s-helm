#!/bin/bash
helm package airflow-k8s-helm/ -d airflow-k8s-helm/releases
helm repo index ../airflow-k8s-helm/airflow-k8s-helm/index.yaml
helm-docs airflow-k8s-helm
mv airflow-k8s-helm/README.md README.md