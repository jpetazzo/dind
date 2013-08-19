# Docker-in-Docker

This recipe lets you run Docker within Docker.

![Inception's Spinning Top](spintop.jpg)

There is only one requirement: your Docker version should support the
`-privileged` flag.


## Quickstart

Build the image:
```
docker build -t dind .
```

Run Docker-in-Docker and get a shell where you can play:
```
docker run -privileged -t -i dind
```

Run Docker-in-Docker and expose the inside Docker to the outside world:
```
docker run -privileged -d -p 4444 -e PORT=4444 dind
```

Note: when started with the `PORT` environment variable, the image will just
the Docker daemon and expose it over said port. When started *without* the
`PORT` environment variable, the image will run the Docker daemon in the
background and execute a shell for you to play.


## How It Works

The main trick is to have the `-privileged` flag. Then, there are a few things
to care about:

- cgroups have to be properly mounted; this is done by the default entrypoint,
  in a way inspired by `cgroups-mount`;
- `/var/lib/docker` cannot be on AUFS, so we make it a volume.

That's it.


## Important Warning About Disk Usage

Since AUFS cannot use an AUFS mount as a branch, it means that we have to
use a volume. Therefore, all inner Docker data (images, containers, etc.)
will be in the volume. Remember: volumes are not cleaned up when you
`docker rm`, so if you wonder where did your disk space go after nesting
10 Dockers within each other, look no further :-)


## Which Version Of Docker Does It Run?

Outside: it will use your installed version.

Inside: the Dockerfile will retrieve the latest `docker` binary from
https://get.docker.io/; so if you want to include *your* own `docker`
build, you will have to edit it. If you want to always use your local
version, you could change the `ADD` line to be e.g.:

    ADD /usr/bin/docker /usr/local/bin/docker


## Can I Run Docker-in-Docker-in-Docker?

Yes. Note, however, that there seems to be a weird FD leakage issue.
To work around it, the `wrapdocker` script carefully closes all the
file descriptors inherited from the parent Docker and `lxc-start`
(except stdio). I'm mentioning this in case you were relying on
those inherited file descriptors, or if you're trying to repeat
the experiment at home.

Also, when you will be exiting a nested Docker, this will happen:

```
root@975423921ac5:/# exit
root@6b2ae8bf2f10:/# exit
root@419a67dfdf27:/# exit
root@bc9f450caf22:/# exit
jpetazzo@tarrasque:~/Work/DOTCLOUD/dind$
```
At that point, you should blast Hans Zimmer's [Dream Is Collapsing](
http://www.youtube.com/watch?v=_IdA7aV4ftY) on your loudspeakers while twirling
a spinning top.
