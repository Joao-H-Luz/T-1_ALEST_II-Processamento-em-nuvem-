FROM python:3.13-slim
WORKDIR /app
# Dependências do sistema
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*
# Instalar dependências do Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# Copiar código do projeto
COPY . .
# Ponto de entrada padrão (roda main.py se quiser)
CMD ["python", "T1-Alest_II/main.py"]
