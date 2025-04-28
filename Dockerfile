# Usa una imagen base de Python
FROM python:3.9-slim-buster

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de requerimientos
COPY requirements.txt .

# Instala las dependencias
RUN pip install -r requirements.txt

# Copia el código de la aplicación al contenedor
COPY . .

# Expone el puerto en el que la aplicación Flask se ejecuta (por defecto es 5000)
EXPOSE 5000

# Define el comando para ejecutar la aplicación Flask
CMD ["python", "app.py"]