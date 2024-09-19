#!/bin/bash

# Check if an app name was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <app-name>"
  exit 1
fi

APP_NAME=$1
PROD_DIR=${APP_NAME}/prod
UAT_DIR=${APP_NAME}/uat

# Create directories for prod and uat if they don't exist
mkdir -p $PROD_DIR
mkdir -p $UAT_DIR

# Generate keys for prod environment
echo "Generating keys for prod environment..."
openssl genrsa -out ${PROD_DIR}/${APP_NAME}_prod_rsa_private_key.pem 2048
openssl rsa -in ${PROD_DIR}/${APP_NAME}_prod_rsa_private_key.pem -out ${PROD_DIR}/${APP_NAME}_prod_rsa_public_key.pem -pubout
openssl pkcs8 -topk8 -in ${PROD_DIR}/${APP_NAME}_prod_rsa_private_key.pem -out ${PROD_DIR}/${APP_NAME}_prod_pkcs8_rsa_private_key.pem -nocrypt

# Generate keys for uat environment
echo "Generating keys for uat environment..."
openssl genrsa -out ${UAT_DIR}/${APP_NAME}_uat_rsa_private_key.pem 2048
openssl rsa -in ${UAT_DIR}/${APP_NAME}_uat_rsa_private_key.pem -out ${UAT_DIR}/${APP_NAME}_uat_rsa_public_key.pem -pubout
openssl pkcs8 -topk8 -in ${UAT_DIR}/${APP_NAME}_uat_rsa_private_key.pem -out ${UAT_DIR}/${APP_NAME}_uat_pkcs8_rsa_private_key.pem -nocrypt

echo "Keys have been generated in the following folders:"
echo "  - $PROD_DIR (prod)"
echo "  - $UAT_DIR (uat)"