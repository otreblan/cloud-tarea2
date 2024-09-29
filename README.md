# Respuestas

## Respuesta de la **Actividad 1.1**

```bash
docker volume create "boston-data"
```

## Respuesta de la **Actividad 1.2**

```bash
docker run --rm -d \
	--name "boston-db" \
	--env-file=.env \
	-p 5432:5432 \
	-v "boston-data:/var/lib/postgresql/data/" \
	postgres:latest
```

## Respuesta de la **Actividad 1.3**

```bash
source .env
docker exec -i boston-db psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /dev/stdin < db.sql
```


## Respuesta de la **Actividad 3.1**

```Dockerfile
FROM python:3.9-slim
WORKDIR /app/
COPY ./app.py ./requirements.txt ./.env /app/
EXPOSE 8080/tcp
RUN pip install -r requirements.txt
CMD [ "python", "app.py"]
```


## Respuesta de la **Actividad 3.2**

```bash
docker build -t otreblan/app:v1.0 .
```


## Respuesta de la **Actividad 3.3**

```bash
docker run --rm -d \
	-p 8080:8080 \
	-e DB_HOST="$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' boston-db)"  \
	--name "boston-app" \
	otreblan/app:v1.0
```

## Respuesta de la **Actividad 4.1**

<!--
docker login
docker push otreblan/app:v1.0
-->
```yml
url: https://hub.docker.com/repository/docker/otreblan/app/general
```

## Respuesta de la **Actividad 5.1**

```yaml
services:
  boston-db:
    container_name: boston-db
    env_file: .env
    image: "postgres:latest"
    ports:
      - "5432:5432"
    volumes:
      - boston-data:/var/lib/postgresql/data/

  boston-app:
    container_name: boston-app
    environment:
      DB_HOST: 172.17.0.2
    ports:
      - "8080:8080"
    image: "otreblan/app:v1.0"

volumes:
  boston-data:
    name: boston-data
    driver: local
```

## Respuesta de la **Actividad 5.2**

```bash
docker compose up -d
```
