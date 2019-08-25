# docker-sonarr-arm32v7

Dockerfile to build [Sonarr](https://sonarr.tv) for the ARM architecture. Based on Alpine Linux for small image size.

## Boards Tested
* Raspberry Pi 3
* Asus Tinkerboard

## Usage
You can pull the built image with

```bash
docker pull bradcordeiro/sonarr-arm32v7
```

The image uses at least two volume mounts, one to a folder or docker volume to Sonarr's configuration and media library between deployments, and one to a folder for media files.

### Run Script Example

```bash
docker run -d \
  -v /path/to/sonarr/config:/root/.config/NzbDrone \
  -v /path/to/media:/media/Multimedia \
  -p 6789:6789
  sonarr-image-name
```

### Docker-compose example

```yml
version: '3'
services:
  sonarr:
    image: bradcordeiro/sonarr:arm32v7
    restart: unless-stopped
    ports:
      - "8989:8989"
    volumes:
      - /path/to/media:/media/Multimedia
      - /path/to/settings:/root/.config/NzbDrone
```