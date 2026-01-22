FROM alpine:latest

WORKDIR /app

# Instalamos Python 3 y PIP. 
# A veces necesitamos 'build-base' si vamos a compilar librerías.
RUN apk add --no-cache python3 py3-pip

# Es buena práctica crear un entorno virtual, pero para este ejemplo simple:
COPY requirements.txt .
# --break-system-packages es necesario en versiones recientes de Python/Alpine
RUN pip3 install --no-cache-dir -r requirements.txt --break-system-packages

COPY . .

CMD ["python3", "app.py"]
