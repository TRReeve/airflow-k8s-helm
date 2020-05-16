airflow-k8s-helm
================
A Helm chart to run an airflow cluster on Kubernetes

Current chart version is `1.0.1`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| airflow.db.create_db | bool | `true` |  |
| airflow.db.dbname | string | `"airflow"` |  |
| airflow.db.host | string | `"airflow-default-db-svc"` |  |
| airflow.db.password | string | `"testadminpass"` |  |
| airflow.db.port | int | `5432` |  |
| airflow.db.protocol | string | `"postgresql+psycopg2"` |  |
| airflow.db.username | string | `"admin"` |  |
| airflow.example_dags.enable | bool | `true` |  |
| airflow.extra_variables | list | `[]` |  |
| airflow.remote_logging.conn_name | string | `"logging"` |  |
| airflow.remote_logging.conn_type | string | `""` |  |
| airflow.remote_logging.create_logging_secret | bool | `true` |  |
| airflow.remote_logging.enable | bool | `false` |  |
| airflow.remote_logging.remote_logging_secret | string | `nil` |  |
| airflow.remote_logging.remote_logs_path | string | `"cloud-data-k8s-staging-logs/airflow/logs"` |  |
| airflow.remote_logging.remote_logs_secrets_filename | string | `"logging-secrets"` |  |
| airflow.scheduler.requests.cpu | string | `"0.5"` |  |
| airflow.scheduler.requests.memory | string | `"500Mi"` |  |
| airflow.secrets.create_secrets_file | bool | `true` |  |
| airflow.secrets.extra_secrets | list | `[]` |  |
| airflow.secrets.secret_file | string | `"secrets-default"` |  |
| airflow.webserver.enable | bool | `true` |  |
| airflow.webserver.ingress.annotations | string | `nil` |  |
| airflow.webserver.ingress.enable | bool | `true` |  |
| airflow.webserver.ingress.host | string | `"airflow.example.mydomain.com"` |  |
| airflow.webserver.replicas | int | `1` |  |
| airflow.webserver.resources.requests.cpu | string | `"0.1"` |  |
| airflow.webserver.resources.requests.memory | string | `"500Mi"` |  |
| airflow.worker.pods_per_heartbeat | int | `5` |  |
| airflow.worker.worker_env_variables | list | `[]` |  |
| images.core.pullPolicy | string | `"Always"` |  |
| images.core.repository | string | `"reevedata/airflow-kubernetes"` |  |
| images.core.tag | string | `"1.10.10"` |  |
| images.worker.pullPolicy | string | `"Always"` |  |
| images.worker.repository | string | `"reevedata/airflow-kubernetes"` |  |
| images.worker.tag | string | `"1.10.10"` |  |
