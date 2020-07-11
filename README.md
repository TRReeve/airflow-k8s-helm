airflow-k8s-helm
================
An airflow cluster fully distributed using the Kubernetes operator

Current chart version is `1.0.4`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| airflow.db.create | bool | `true` | Create a postgres backend for your airflow cluster. More suitable for testing than for production. |
| airflow.db.dbname | string | `"airflow"` |  |
| airflow.db.host | string | `"airflow-default-db-svc"` |  |
| airflow.db.password | string | `"testadminpass"` |  |
| airflow.db.port | int | `5432` |  |
| airflow.db.protocol | string | `"postgresql+psycopg2"` |  |
| airflow.db.username | string | `"admin"` |  |
| airflow.envVars | object | `{}` | Extra Variables to create in your webserver and scheduler containers. |
| airflow.exampleDags.enable | bool | `true` | Create example dags |
| airflow.image.pullPolicy | string | `"Always"` |  |
| airflow.image.repository | string | `"reevedata/airflow-kubernetes"` | Airflow Image |
| airflow.image.tag | string | `"1.10.10"` |  |
| airflow.remoteLogging.connName | string | `"logging"` | Name you want to give the connection used for remote logging. |
| airflow.remoteLogging.connType | string | `nil` | The type of connection you want to set up for remote logging. This chart has been tested with s3 (AWS) and gs (GCP) |
| airflow.remoteLogging.createSecret | bool | `true` | Create a logging secret file using the secret defined under remote_logging_secret This needs to contain the login:password or similar for |
| airflow.remoteLogging.credential | string | `nil` | If create_logging_secret is true, the secret you want to use for remote logging. |
| airflow.remoteLogging.enable | bool | `false` | enable remote logging to an s3/gcs..etc. Recommended as workers are ephemeral. |
| airflow.remoteLogging.path | string | `nil` |  |
| airflow.remoteLogging.secretName | string | `"logging-secrets"` | The name of the secrets file providing a REMOTE_LOGGING_SECRET that will be used to construct an airflow URI for the connection |
| airflow.scheduler.requests.cpu | string | `"0.5"` |  |
| airflow.scheduler.requests.memory | string | `"500Mi"` |  |
| airflow.secrets.createFile | bool | `true` | create a secrets file using the credentials provided in the db section and extra secrets sections. or set to false and provide a secrets file providing DB_HOST and DB_PASSWORD for your airflow backend and any other secrets you wish to provide to your environment. |
| airflow.secrets.extraSecrets | list | `[]` | The name of a secret object in the same namespace. This will contain DB_PASSWORD, DB_HOST, REMOTE_LOGGING_STRING    secret_file: my-secrets    secret_file: Any Further Secrets that need to be available in the environment can be added here. IF PROVIDING FILE: Secret only needs to a list form e.g    extra_secrets:      - Secret1      - Secret2 IF SECRETS TO BE CREATED BY THIS HELM CHART (not recommended for production): Secrets to be provided as a map e.g      extra_secrets:        Secret1: "admin"        Secret2: "otherpass" |
| airflow.secrets.secretName | string | `"secrets-default"` | a secrets file providing DB_HOST and DB_PASSWORD for your airflow backend and any other secrets you wish to provide  to your environment. |
| airflow.webserver.enable | bool | `true` | Whether to create webserver UI |
| airflow.webserver.ingress.annotations | string | `nil` | Ingress annotations for your ingress controller. |
| airflow.webserver.ingress.enable | bool | `true` | Whether to create an ingress for your webserver. |
| airflow.webserver.ingress.host | string | `"airflow.helmdeploy.data.global.com"` | Host for your ingress controller. |
| airflow.webserver.replicas | int | `1` |  |
| airflow.webserver.resources.requests.cpu | string | `"0.1"` |  |
| airflow.webserver.resources.requests.memory | string | `"500Mi"` |  |
| airflow.worker.envVars | object | `{}` | Additional Environment variables that will be created on workers when they initialise |
| airflow.worker.podsPerHeartbeat | int | `5` |  |
