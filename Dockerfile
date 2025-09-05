# Usa una imagen base oficial y ligera de Python
FROM python:3.10-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia e instala las dependencias primero para aprovechar el caché de Docker
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del código de la aplicación
COPY app.py .

# Expone el puerto que usará la aplicación
EXPOSE 8000

# Comando para ejecutar la aplicación con Uvicorn
# Le dice a Uvicorn que busque el objeto 'app' en el archivo 'app.py'
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]