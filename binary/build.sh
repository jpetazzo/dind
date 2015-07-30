#!/bin/bash

cp ../wrapdocker .
docker build -t dind_binary .
rm wrapdocker
