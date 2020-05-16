#!/usr/bin/env bash

export PYTHONPATH=$PYTHONPATH:$AIRFLOW_HOME


case "$1" in
  webserver)
    echo "init database"
    airflow initdb
    if [ $AIRFLOW__CORE__REMOTE_LOGGING = "True" ]; then
      echo "Initialising connection $REMOTE_LOGGING_CONN_NAME"
      python3 /create_connection.py
    fi
    sleep 10
    exec airflow "$@"
    ;;
  scheduler)
    exec airflow "$@"
esac


