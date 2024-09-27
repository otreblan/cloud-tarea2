# Implementar el Dockerfile
FROM python:3.9-slim
WORKDIR /app/
COPY ./app.py ./requirements.txt ./.env /app/
EXPOSE 8080/tcp
ENV DB_HOST=172.17.0.2
RUN pip install -r requirements.txt
CMD [ "python", "app.py"]
