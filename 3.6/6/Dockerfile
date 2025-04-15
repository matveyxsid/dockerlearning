FROM python:3.9
RUN apt-get update && apt-get install -y curl
RUN useradd -m webuser
WORKDIR /home/webuser/app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl -f http://localhost:5000/health || exit 1
VOLUME /data/logs
USER webuser
CMD ["python", "app.py"]
