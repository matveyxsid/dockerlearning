FROM python:3.9
WORKDIR /app
RUN pip install Flask && pip install Werkzeug==2.2.2
COPY ./app.py /app
EXPOSE 8000
CMD ["python", "app.py"]

