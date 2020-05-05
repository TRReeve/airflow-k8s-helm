#!/usr/bin/env bash

export PYTHONPATH=$PYTHONPATH:$AIRFLOW_HOME

case "$1" in
  webserver)
    echo "init database"
    airflow initdb
    sleep 5
    exec airflow "$@"
    ;;
  scheduler)
    # To give the webserver time
    # to run initdb.
    exec airflow "$@"
esac


