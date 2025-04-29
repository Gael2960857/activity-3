#!/bin/bash
# pull_docker_image.sh

echo "Iniciando la descarga de la nueva imagen de Docker desde ECR..."

# Define las variables para la imagen de ECR
AWS_REGION="us-east-1" # Reemplaza con tu región de AWS (ej: us-east-1)
AWS_ACCOUNT_ID="718446402284" # Reemplaza con tu ID de cuenta de AWS
IMAGE_REPO_NAME="my-app" # Reemplaza con el nombre de tu repositorio en ECR
IMAGE_TAG="latest" # O la etiqueta específica que quieras desplegar

ECR_IMAGE_URI="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_REPO_NAME:$IMAGE_TAG"

echo "Intentando descargar la imagen: $ECR_IMAGE_URI"

# Autenticación con ECR (asumiendo que la instancia tiene los permisos IAM adecuados)
aws ecr get-login-password --region "$AWS_REGION" | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"

# Descargar la imagen
docker pull "$ECR_IMAGE_URI"

if [ $? -eq 0 ]; then
  echo "La imagen de Docker se descargó exitosamente."
else
  echo "Error al descargar la imagen de Docker."
  exit 1
fi