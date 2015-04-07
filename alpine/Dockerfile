FROM gliderlabs/alpine
MAINTAINER platform-eng@c2fo.com

# Let's start with some basic stuff.
RUN apk-install iptables ca-certificates lxc e2fsprogs 

# Install Docker from Alpine repos
RUN apk-install docker

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]

