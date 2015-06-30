FROM alpine:3.2
MAINTAINER t.dettrick@uq.edu.au

# Dependencies
RUN apk add --update iptables ca-certificates lxc e2fsprogs && \
  rm -rf /var/cache/apk/*

# Fake dmsetup, as device-mapper isn't compatible for static builds
ADD ./dmsetup /usr/local/bin/dmsetup

# Install Docker from binary
ADD https://get.docker.com/builds/Linux/x86_64/docker-latest /usr/local/bin/docker

# Install the magic wrapper
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/dmsetup /usr/local/bin/docker /usr/local/bin/wrapdocker 

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]
