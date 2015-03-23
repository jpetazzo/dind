#!/bin/bash

cp ../wrapdocker .
docker build -t dind_alpine .
rm wrapdocker
