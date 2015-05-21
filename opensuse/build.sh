#!/bin/bash

cp ../wrapdocker .
docker build -t dind_opensuse .
rm wrapdocker
