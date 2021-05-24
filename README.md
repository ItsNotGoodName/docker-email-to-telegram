# docker-email-to-telegram

Docker container for [email-to-telegram](https://github.com/ItsNotGoodName/email-to-telegram).

## Usage

### docker-compose

```
---
version: "2.1"
services:
  email-to-telegram:
    image: itsnotgoodname/email-to-telegram
    container_name: email-to-telegram
    environment:
      - PASSWORD=password
    ports:
      - 25:25
    volumes:
      - /path/to/config.ini:/config.ini
    restart: unless-stopped
```

### docker

```
docker run -d \
  --name=email-to-telegram \
  -p 25:25 \
  -e PASSWORD=password \
  -v /path/to/config.ini:/config.ini \
  --restart unless-stopped \
  itsnotgoodname/email-to-telegram
```
