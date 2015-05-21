FROM opensuse:latest
MAINTAINER git@yeoldegrove.de

# Let's start with some basic stuff.
RUN zypper --gpg-auto-import-keys --non-interactive refresh && \
    zypper --gpg-auto-import-keys --non-interactive update && \
    zypper --gpg-auto-import-keys --non-interactive install --auto-agree-with-licenses docker

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]

