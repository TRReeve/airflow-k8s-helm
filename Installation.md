helm repo add airflow-kubernetes https://trreeve.github.io/airflow-k8s-helm/airflow-k8s-helm
helm upgrade --install airflow -n airflow airflow-kubernetes