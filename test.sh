#!/bin/bash

install -d build
pushd build
cmake -G Ninja ..
ninja
popd
install build/qdir Docker
pushd Docker
sudo docker build . -t qdir
./qdir
sudo docker run -it qdir 
popd
