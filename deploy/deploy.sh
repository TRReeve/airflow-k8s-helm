#!/usr/bin/env bash

DIRECTORY=`dirname $0`
APPLICATION_NAME="airflow-kubernetes"
VERSION=`cat $DIRECTORY/VERSION`
DOCKERFILE_LOCATION=$DIRECTORY/../docker/airflow

echo $VERSION
echo "Pushing $APPLICATION_NAME:$VERSION to reevedata/$APPLICATION_NAME:$VERSION " \
&& docker build -t $APPLICATION_NAME $DOCKERFILE_LOCATION \
&& docker tag $APPLICATION_NAME:latest reevedata/$APPLICATION_NAME:$VERSION \
&& docker push reevedata/$APPLICATION_NAME:$VERSION
