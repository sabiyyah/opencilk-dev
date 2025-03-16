#!/bin/bash

cd "$(dirname "$0")"/..

git submodule update --init --recursive

pushd src/opencilk

ln -fs ../cheetah cheetah
ln -fs ../cilktools cilktools

popd
