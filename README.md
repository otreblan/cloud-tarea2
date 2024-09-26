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

```


## Respuesta de la **Actividad 3.2**

```bash

```


## Respuesta de la **Actividad 3.3**

```bash
# Comando incompleto
docker run -e DB_HOST=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' boston-db) 
```

## Respuesta de la **Actividad 4.1**

```yml

```

## Respuesta de la **Actividad 5.1**

```bash

```

## Respuesta de la **Actividad 5.2**

```bash

```
