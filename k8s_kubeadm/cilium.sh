#!/bin/bash

# yes | sudo bash cilium.sh

echo "........................Cilium_without_kubeproxy........................"

helm repo add cilium https://helm.cilium.io/

API_SERVER_IP=192.168.1.110
API_SERVER_PORT=6443
helm install cilium cilium/cilium --version 1.12.1 \
--namespace kube-system \
--set kubeProxyReplacement=strict \
--set k8sServiceHost=${API_SERVER_IP} \
--set k8sServicePort=${API_SERVER_PORT}

echo "........................Cilium_CLI........................"

CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/master/stable.txt)
CLI_ARCH=amd64
if [ "$(uname -m)" = "aarch64" ]; then CLI_ARCH=arm64; fi
curl -L --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
sha256sum --check cilium-linux-${CLI_ARCH}.tar.gz.sha256sum
sudo tar xzvfC cilium-linux-${CLI_ARCH}.tar.gz /usr/local/bin
rm cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}

echo "........................Cilium_ingress........................"

helm upgrade cilium cilium/cilium --version 1.12.1 \
--namespace kube-system \
--reuse-values \
--set ingressController.enabled=true
kubectl -n kube-system rollout restart deployment/cilium-operator
kubectl -n kube-system rollout restart ds/cilium

cilium status
cilium connectivity test

# kubectl -n kube-system get pods -l k8s-app=cilium
# kubectl -n kube-system exec ds/cilium -- cilium status | grep KubeProxyReplacement
# kubectl -n kube-system exec ds/cilium -- cilium status --verbose