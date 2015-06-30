FROM alpine:3.2
MAINTAINER t.dettrick@uq.edu.au

# Fake dmsetup, as device-mapper isn't compatible for static builds
ADD ./dmsetup /usr/local/bin/dmsetup

# Install the magic wrapper
ADD ./wrapdocker /usr/local/bin/wrapdocker

# Dependencies & Install
RUN DOCKER_VERSION=latest && \
  apk add --update iptables curl ca-certificates lxc e2fsprogs && \
  curl -L https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION \
    > /usr/local/bin/docker && \
  chmod +x /usr/local/bin/* && \
  apk del --purge curl && \
  rm -rf /var/cache/apk/*

# Docker volume and run command
VOLUME /var/lib/docker
CMD ["wrapdocker"]
