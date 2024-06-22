#!/bin/sh
set -o xtrace

# Stop and remove vault containers if already running
docker stop vault-demo-vault
docker rm vault-demo-vault

# Pull the latest Vault image from HashiCorp's Docker registry
docker pull hashicorp/vault

# Start Vault in dev mode on port 8200
location=$(pwd)
docker run --name vault-demo-vault -v ${location}/log:/var/log \
--network dev-network -p 8200:8200 hashicorp/vault \
server -dev -dev-root-token-id="root" &