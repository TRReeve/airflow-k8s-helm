airflow-kubernetes
==================
A Helm chart for Kubernetes

Current chart version is `0.1.0`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| airflow.db.create_db | bool | `true` | whether to create a postgres database, if false then you will need to provide information for an external DB (Postgres Recommended) |
| airflow.db.dbname | string | `"airflow"` |  |
| airflow.db.host | string | `"airflow-default-db-svc"` |  |
| airflow.db.password | string | `"admin"` |  |
| airflow.db.port | int | `5432` |  |
| airflow.db.protocol | string | `"postgresql+psycopg2"` |  |
| airflow.db.username | string | `"admin"` |  |
| airflow.example_dags.enable | bool | `true` |  |
| airflow.extra_variables | string | `nil` | Additional variables that will be created in the environment of airflow and scheduler containers |
| airflow.rbac.enable | bool | `false` | Not Functioning |
| airflow.remote_logging.conn_name | string | `"logging"` |  |
| airflow.remote_logging.enable | bool | `false` | Create remote logging connection (recommended) |
| airflow.remote_logging.logging_connection_string | string | `""` | the raw string that to provide your logging connection, recommended to use a secret file for production. |
| airflow.remote_logging.logs_folder | string | `""` | target folder for your remote logging connection |
| airflow.scheduler.requests.cpu | string | `"0.5"` |  |
| airflow.scheduler.requests.memory | string | `"500Mi"` |  |
| airflow.secrets.create_secrets_file | bool | `true` |  |
| airflow.secrets.extra_secrets | list | `[]` |  |
| airflow.webserver.enable | bool | `true` | enable webserver component allowing you to access a ui |
| airflow.webserver.ingress.annotations | string | `nil` |  |
| airflow.webserver.ingress.enable | bool | `true` | create an ingress to allow you to access your webserver from outside the cluster. you will need to provide annotations. |
| airflow.webserver.ingress.host | string | `"airflow.example.com"` | the host to set up for your cluster (requires dns)  |
| airflow.webserver.replicas | int | `1` | Number of replica pods for serving UI requests.  |
| airflow.webserver.resources.requests.cpu | string | `"0.1"` |  |
| airflow.webserver.resources.requests.memory | string | `"100Mi"` |  |
| airflow.worker.pods_per_heartbeat | int | `5` |  |
| airflow.worker.worker_env_variables | list | `[]` | Extra variables to be made available on worker pods.|
| images.core.pullPolicy | string | `"IfNotPresent"` |  |
| images.core.repository | string | `"reevedata/airflow-kubernetes"` |  |
| images.core.tag | string | `"v1.0.1"` |  |
| images.worker.pullPolicy | string | `"IfNotPresent"` |  |
| images.worker.repository | string | `"reevedata/airflow-kubernetes"` |  |
| images.worker.tag | string | `"v1.0.1"` |  |
