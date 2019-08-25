FROM arm32v7/alpine:3.10
LABEL build-date="2019-08-25T21:09:27Z"
LABEL name="sonarr-arm32v7"
LABEL description="Sonarr for the arm32v7 architecture"
LABEL url="https://sonarr.tv"
LABEL vcs-ref="https://github.com/bradcordeiro/docker-sonarr-arm32v7"

WORKDIR /opt

RUN apk add --no-cache mono --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    apk add --no-cache --virtual=.build-dependencies && \
    apk del .build-dependencies

RUN apk add --no-cache sqlite-libs mediainfo

RUN apk add --no-cache curl && \
	curl -sL http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz | tar xz && \
	apk del curl

# Folder of media files
VOLUME /media/Multimedia
# Folder of media database and settings
VOLUME /root/.config/NzbDrone 

EXPOSE 8989

ENTRYPOINT ["mono"]
CMD ["--debug", "/opt/NzbDrone/NzbDrone.exe"]
