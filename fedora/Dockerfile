FROM fedora:20
MAINTAINER amitsaha.in@gmail.com

# Let's start with some basic stuff.
RUN yum -y clean all
RUN yum -y update
RUN yum install -y iptables ca-certificates lxc

# Install Docker from Fedora repos
RUN yum -y install docker-io

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]

