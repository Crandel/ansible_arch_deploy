#!/bin/sh

docker build -t test_arch .

docker run -d -it --name arch1 my_arch
docker run -d -it --name arch2 my_arch
docker run -d -it --name arch3 my_arch
