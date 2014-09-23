#!/bin/bash

cp ../wrapdocker .
docker build -t dind_fedora .
rm wrapdocker
