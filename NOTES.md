###### Why?

I've not yet found a decent helm chart for airflow utilising 
the KubernetesOperator fully. The deployment pattern utilising 
Celery workers and a redis (or similar cache) increases operational overhead
and set up time/cost from ensuring a reliable network connection 
and configuration with between celery workers. I'm a fan of the Kubernetes
deployment as it minimises the amount of time managing infrastructure and 
we don't have to spend time managing queues and other celery related
concepts.


######How to Deploy

The kubernetes deployment
consists of database, worker, and scheduler. And that's it. It brings up
workers to handle jobs for you in one of two ways

- Use an identical image containing code and scripts to 
run python/bash/other operators. This allows you to deploy one 
image and test it before deployment. Or you can create a seperate worker image
that just has airflow installed.

- Use the [Kubernetes Pod Operator](https://airflow.apache.org/docs/stable/kubernetes.html) to run jobs contained in docker containers
this lets you pretty much run anything you want as a process.

######Roll your own container
You can bake your own container completely seperate to the reevedata/airflow-kubernetes containers. They just have to contain
an entrypoint.sh script in the root that defines starting with a webserver or a scheduler argument. ( see templates/scheduler and templates/webserver under spec.template.spec.containers[0].command for how the containers are triggered) 


######Remote Logging

This is always more finicky than expected with airflow. The short version of it is 
you need to construct a [connection uri](https://airflow.apache.org/docs/stable/_api/airflow/models/connection/index.html?highlight=connection%20uri)
e.g s3://accesskey:secret@mylogspath/airflow/log. Then you need 
to have your REMOTE_LOGS_BASE_PATH variable set in your airflow environment to point 
the logging at the correct location. For some reason I haven't been able to dig into 
the workers and the webserver seem to handle this differently. So you can 
have a situation where the worker logs the file to s3 but the webserver couldn't find the log
in the UI instead throwing an error. This helm template handles it for you by 
constructing the uri for you. Annoyingly due to the nature of kubernetes secrets 
i wasn't able to find a way to expand it in a way that airflow could process the existence 
of the connection at startup. The reason I don't think this is a problem for production use 
is if someone hostile is dicking around on your server looking in your environment you've already 
screwed up. The main thing is the username:password element of the credential is a security risk
so this is injected into the container through a secret. THEN expanded into the environment to be used.

######RBAC

This is useul for handling your airflow cluster as a multi tenant operation.
For now you're on your own to set this up but this is something I would like to configure 
on the deployment. The main issue is this will likely require some 
sort of python script baked into the container to handle configuration
at which point it becomes more complicated to create a generalisable configuration.


######Prometheus

Some sort of monitoring endpoint baked into the containers to export metrics to a prometheus endpoint would likely be useful
but this seems relatively low priority for the moment as the main metrics of interest are CPU/Memory usage 
and the request size of your containers when set up. 
