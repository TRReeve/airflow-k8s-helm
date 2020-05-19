airflow-k8s-helm
================
An airflow cluster fully distributed using the Kubernetes operator

Current chart version is `1.0.2`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| airflow.db.create_db | bool | `true` | Create a postgres backend for your airflow cluster. More suitable for testing than for production. |
| airflow.db.dbname | string | `"airflow"` |  |
| airflow.db.host | string | `"airflow-default-db-svc"` |  |
| airflow.db.password | string | `"testadminpass"` |  |
| airflow.db.port | int | `5432` |  |
| airflow.db.protocol | string | `"postgresql+psycopg2"` |  |
| airflow.db.username | string | `"admin"` |  |
| airflow.example_dags.enable | bool | `true` | Create example dags |
| airflow.extra_variables | list | `[]` | Extra Variables to create in your webserver and scheduler containers. |
| airflow.remote_logging.conn_name | string | `"logging"` | Name you want to give the connection used for remote logging. |
| airflow.remote_logging.conn_type | string | `nil` | The type of connection you want to set up for remote logging. This chart has been tested with s3 (AWS) and gs (GCP) |
| airflow.remote_logging.create_logging_secret | bool | `true` | Create a logging secret file using the secret defined under remote_logging_secret This needs to contain the login:password or similar for |
| airflow.remote_logging.enable | bool | `false` | enable remote logging to an s3/gcs..etc. Recommended as workers are ephemeral. |
| airflow.remote_logging.logging_credential | string | `nil` |  |
| airflow.remote_logging.logging_secret | string | `"logging-secrets"` |  |
| airflow.remote_logging.remote_logs_path | string | `"cloud-data-k8s-staging-logs/airflow/logs"` | the path logs will be written to in your remote storage bucket. |
| airflow.scheduler.requests.cpu | string | `"0.5"` |  |
| airflow.scheduler.requests.memory | string | `"500Mi"` |  |
| airflow.secrets.create_secrets_file | bool | `true` | create a secrets file using the credentials provided in the db section and extra secrets sections. or set to false and provide a secrets file providing DB_HOST and DB_PASSWORD for your airflow backend and any other secrets you wish to provide to your environment. |
| airflow.secrets.extra_secrets | list | `[]` | The name of a secret object in the same namespace. This will contain DB_PASSWORD, DB_HOST, REMOTE_LOGGING_STRING    secret_file: my-secrets    secret_file: |
| airflow.secrets.secret_file | string | `"secrets-default"` | a secrets file providing DB_HOST and DB_PASSWORD for your airflow backend and any other secrets you wish to provide  to your environment. |
| airflow.webserver.enable | bool | `true` | Whether to create webserver UI |
| airflow.webserver.ingress.annotations | string | `nil` | Ingress annotations for your ingress controller. |
| airflow.webserver.ingress.enable | bool | `true` | Whether to create an ingress for your webserver. |
| airflow.webserver.ingress.host | string | `"airflow.example.mydomain.com"` | Host for your ingress controller. |
| airflow.webserver.replicas | int | `1` |  |
| airflow.webserver.resources.requests.cpu | string | `"0.1"` |  |
| airflow.webserver.resources.requests.memory | string | `"500Mi"` |  |
| airflow.worker.pods_per_heartbeat | int | `5` | number of pods to create per scheduler heartbeat |
| airflow.worker.worker_env_variables | list | `[]` | Additional Environment variables that will be created on workers when they initialise |
| images.core.pullPolicy | string | `"Always"` |  |
| images.core.repository | string | `"reevedata/airflow-kubernetes"` |  |
| images.core.tag | string | `"1.10.10"` |  |
| images.worker.pullPolicy | string | `"Always"` |  |
| images.worker.repository | string | `"reevedata/airflow-kubernetes"` |  |
| images.worker.tag | string | `"1.10.10"` |  |
