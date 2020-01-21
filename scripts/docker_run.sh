#!/bin/bash

if [ -z "$PROJECT" ]; then
    echo "Must set \$PROJECT"
    exit 1
fi

docker run --rm -p 10000:10000 gcr.io/$PROJECT/envoy -l debug -c /etc/envoy/envoy.yaml

