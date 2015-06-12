#!/bin/bash

cp ../wrapdocker .
docker build -t dind_archlinux .
rm wrapdocker
