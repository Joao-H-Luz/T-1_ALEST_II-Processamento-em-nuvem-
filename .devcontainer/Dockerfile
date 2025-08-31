# Base Anaconda Python 3
FROM mcr.microsoft.com/devcontainers/anaconda:1-3

# Criar pasta de trabalho
WORKDIR /app

# Copiar environment.yml se existir, atualizar base do Conda
COPY environment.yml* .devcontainer/noop.txt /tmp/conda-tmp/
RUN if [ -f "/tmp/conda-tmp/environment.yml" ]; then \
        umask 0002 && /opt/conda/bin/conda env update -n base -f /tmp/conda-tmp/environment.yml; \
    fi && rm -rf /tmp/conda-tmp

# Copiar código do projeto
COPY . /app

# Ponto de entrada padrão (opcional)
CMD ["python", "T1-Alest_II/main.py"]

