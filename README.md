airflow-k8s-helm
================
A Helm chart for Kubernetes

Current chart version is `0.1.1`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| airflow.db.create_db | bool | `true` |  |
| airflow.db.dbname | string | `"airflow"` |  |
| airflow.db.host | string | `"airflow-default-db-svc"` |  |
| airflow.db.password | string | `"admin"` |  |
| airflow.db.port | int | `5432` |  |
| airflow.db.protocol | string | `"postgresql+psycopg2"` |  |
| airflow.db.username | string | `"admin"` |  |
| airflow.example_dags.enable | bool | `true` |  |
| airflow.extra_variables | string | `nil` |  |
| airflow.rbac.enable | bool | `false` |  |
| airflow.remote_logging.conn_name | string | `"logging"` |  |
| airflow.remote_logging.enable | bool | `false` |  |
| airflow.remote_logging.logging_connection_string | string | `""` |  |
| airflow.remote_logging.logs_folder | string | `""` |  |
| airflow.scheduler.requests.cpu | string | `"0.5"` |  |
| airflow.scheduler.requests.memory | string | `"500Mi"` |  |
| airflow.secrets.create_secrets_file | bool | `true` |  |
| airflow.secrets.extra_secrets | list | `[]` |  |
| airflow.webserver.enable | bool | `true` |  |
| airflow.webserver.ingress.annotations."alb.ingress.kubernetes.io/target-type" | string | `"instance"` |  |
| airflow.webserver.ingress.annotations."kubernetes.io/ingress.class" | string | `"alb"` |  |
| airflow.webserver.ingress.enable | bool | `true` |  |
| airflow.webserver.ingress.host | string | `"airflow.example.com"` |  |
| airflow.webserver.replicas | int | `1` |  |
| airflow.webserver.resources.requests.cpu | string | `"0.1"` |  |
| airflow.webserver.resources.requests.memory | string | `"100Mi"` |  |
| airflow.worker.pods_per_heartbeat | int | `5` |  |
| airflow.worker.worker_env_variables | list | `[]` |  |
| images.core.pullPolicy | string | `"IfNotPresent"` |  |
| images.core.repository | string | `"reevedata/airflow-kubernetes"` |  |
| images.core.tag | string | `"v1.0.1"` |  |
| images.worker.pullPolicy | string | `"IfNotPresent"` |  |
| images.worker.repository | string | `"reevedata/airflow-kubernetes"` |  |
| images.worker.tag | string | `"v1.0.1"` |  |
