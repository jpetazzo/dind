FROM fedora:22
MAINTAINER amitsaha.in@gmail.com

# Install docker
RUN dnf -y update && dnf -y install docker && dnf clean all

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]
