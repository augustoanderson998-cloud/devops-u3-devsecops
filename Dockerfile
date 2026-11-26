FROM python:3.9-slim

WORKDIR /app
COPY app.py .

# Força instalação de versão antiga de pacote para fins de teste de vulnerabilidade
RUN pip install --no-cache-dir urllib3==1.26.5

EXPOSE 8080
CMD ["python", "app.py"]
