helm package airflow-k8s-helm/ -d airflow-k8s-helm/
helm repo index airflow-k8s-helm/
helm-docs
mv airflow-k8s-helm/README.md .

