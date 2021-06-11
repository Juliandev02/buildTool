#!/bin/bash

function onBuild() {
    make.sh
}

if [[ $(id -u) != 0 ]]; then
    echo "To build, make sure you're root!"

elif [[ $1 == "clean" ]]; then
    echo "Removing build directory..."
    rm -r build

elif [[ $1 == "do" ]]; then
    echo "Building..."
    sleep 0.7
    bash make.sh

else
    echo "build_0.22"
fi
