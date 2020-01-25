#!/usr/bin/env bash

bazelisk run //dev/minikube:start

# set up creds for GCR
sleep 1
sed -e "s/APPLICATION_DEFAULT_CREDENTIALS/$(base64 $HOME/.config/gcloud/application_default_credentials.json)/" k8s/registry_secret.yaml.tmpl > k8s/registry_secret.yaml
kubectl apply -f k8s/registry_secret.yaml
sleep 15
# reset creds container after applying secrets
kubectl scale -n kube-system deployment.apps/registry-creds --replicas=0
sleep 15
kubectl scale -n kube-system deployment.apps/registry-creds --replicas=1
sleep 15
# end

# deploy xds server
bazelisk run //k8s:start_all.apply --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64
