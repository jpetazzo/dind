FROM finalduty/archlinux:daily
MAINTAINER logan@logankoester.com

# Install Docker from Arch repos
RUN pacman -Syy --noprogressbar --noconfirm --needed ca-certificates lxc e2fsprogs docker

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]

