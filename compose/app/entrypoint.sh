#!/usr/bin/env bash

set -ex

export PYTHONPATH=${PYTHONPATH}:${APP_DIR}

function run_dev_server() {
  uvicorn main:app --app-dir=./app/
}

function run_server() {
  uvicorn main:app --app-dir=./app/ --reload
}

case "$1" in
  "run-dev-server") run_dev_server ;;
  "run-server") run_server ;;
  "bash") bash ;;
  "python") python ;;
  *) bash ;;
esac
