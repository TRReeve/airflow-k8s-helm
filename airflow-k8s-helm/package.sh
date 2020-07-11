helm package .
helm repo index .
helm-docs . -o ../README.md
mv index.yaml airflow-k8s-helm/


