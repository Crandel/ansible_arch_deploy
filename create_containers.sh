#!/bin/sh

docker build -t test_arch .

docker run -d -it --name arch1 test_arch
docker run -d -it --name arch2 test_arch
docker run -d -it --name arch3 test_arch
