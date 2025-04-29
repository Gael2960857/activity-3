#!/bin/bash
# start_application.sh

echo "Iniciando el nuevo contenedor de la aplicación..."

# Define las variables para el contenedor
CONTAINER_NAME="mi-app-flask-container"
DOCKER_IMAGE="718446402284.dkr.ecr.us-east-1.amazonaws.com/my-app:latest" # Asegúrate de que coincida con la imagen descargada
HOST_PORT="5000" # El puerto en la instancia EC2
CONTAINER_PORT="5000" # El puerto expuesto por el contenedor

# Detener y remover el contenedor existente si está en ejecución (por seguridad)
CONTAINER_ID=$(docker ps -a --filter "name=$CONTAINER_NAME" --format "{{.ID}}")
if [ -n "$CONTAINER_ID" ]; then
  echo "Deteniendo y removiendo el contenedor existente: $CONTAINER_ID"
  docker stop "$CONTAINER_ID"
  docker rm "$CONTAINER_ID"
fi

# Iniciar el nuevo contenedor
docker run -d --name "$CONTAINER_NAME" -p "$HOST_PORT:$CONTAINER_PORT" "$DOCKER_IMAGE"

if [ $? -eq 0 ]; then
  echo "El contenedor de la aplicación se inició exitosamente."
else
  echo "Error al iniciar el contenedor de la aplicación."
  exit 1
fi