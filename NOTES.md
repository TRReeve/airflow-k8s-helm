A Helm chart for an opinionated Airflow cluster that deploys to Kubernetes.

Implements 
- Remote Logging
- Ingress
- Created Database if enabled
- Created Secrets if enabled

Not Implemented
- RBAC

Lifecycle 
- On upgrade restarts scheduler and webserver. Does not attempt to Restart Database
Running jobs will continue to run in pods and be picked up by scheduler on reboot.  

Deployment Options
- Build your own docker containers with your code in them and replace the images 
in under images with those. The containers will need "entrypoint.sh" (docker/airflow/script/entrypoint.sh) available 
at the top level of the file system in order to start. 

- Extend the template to mount shared nfs to containers (trickier)


 

