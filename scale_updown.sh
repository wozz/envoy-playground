#!/bin/bash -ex

while true;
do
    kubectl scale deployment.apps/simpleapp-deployment --replicas=20
    sleep 30
    kubectl scale deployment.apps/simpleapp-deployment --replicas=5
    sleep 30
done
