#!/bin/sh
set -e

helm3 template -f ${1:-example.yaml} ${2:-appname} --namespace ${3:-namespace} --debug .
helm3 lint -f ${1:-example.yaml} .

