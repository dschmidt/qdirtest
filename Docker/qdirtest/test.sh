#!/bin/bash

install -d build
pushd build
cmake -G Ninja ..
ninja
./qdir
popd
