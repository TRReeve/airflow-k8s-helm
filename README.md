Airflow-k8s-helm 
==================
A Helm chart for Kubernetes to bootstrap an airflow cluster using the kubernetes
operator that simplifies remote logging, ingresses and database deployment.Base docker image for this 
can be found [here](https://hub.docker.com/repository/docker/reevedata/airflow-kubernetes)
this has been intentionally kept minimal and as much configuration as possible has been offloaded to the chart. 
Current chart version is `0.1.0`

Installation
===========

    helm repo add airflow-k8s https://trreeve.github.io/airflow-k8s-helm/airflow-k8s-helm
    kubectl create namespace airflow-test
    helm upgrade --install airflow -n airflow-testing airflow-k8s/airflow-k8s-helm


Why?
===

All the airflow helm charts I've found have been for some flavour of Celery/Redis Workers deployment pattern
which incurs a higher operational cost having run it myself for a while in an enterprise production system. This chart specifically focuses on the KubernetesOperator Deployment with workers either being a default worker image or using other custom docker containers as the 
Kubernetes deployment facilitates. This makes things a lot easier to scale and a lot easier to manage dependencies by using different containers rather than managing queues. 

Other realisation I've come to over time is it's a lot easier and safer to have a complete atomic deployment that can be incremented to roll back over sharing state (aka code + dags) between workers and schedulers etc. 



Implements
==========
- Remote Logging
- Ingress
- Database
- Secrets

Not Implemented (Yet)
==============
- RBAC

Lifecycle
========= 
- On upgrade restarts scheduler and webserver. Does not attempt to Restart Database
Running jobs will continue to run in pods and be picked up by scheduler on reboot. If you are not creating a database then db access is provided through an external service.

Deployment Options
==================
- Build your own docker containers with your code in them and replace the images 
in under images with those. The containers will need "entrypoint.sh" (docker/airflow/script/entrypoint.sh) available 
at the top level of the file system in order to start. 

- Extend the template to mount shared nfs to containers (trickier)


Chart Values

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
