#!/bin/bash

function onBuild() {
    sleep 0.7
    bash make.sh
}

function onRemove() {
    sleep 0.3
    rm -r build
}

function await() {
    sleep 0.1 
}

function onWait () {
    sleep 0.9
}


if [[ $(id -u) != 0 ]]; then
    echo "To build, make sure you're root!"


elif [[ $1 == "clean" ]]; then
    echo "Removing build directory..."

    if [ ! -d "./build/" ]; then
    sleep 0.3
        echo "build-directory does not exists. Terminating"
        exit
    fi

    onRemove


elif [[ $1 == "do" ]]; then
    echo "Building..."

    if [ ! -f "./make.sh" ]; then
        sleep 0.7
        echo "make.sh does not exists. Terminating"
        exit
    fi
    
    onBuild

elif [[ $1 = "makefile" ]]; then
    echo "Building from file..."

    read -ep "Input Makefile here: " -i " " file

    sleep 1.2334
    if [[ -z "$file" ]]; then
        echo "Terminating."
        exit
    fi

        if [ ! -f "$file" ]; then
        sleep 0.7
        echo "make.sh does not exists. Terminating"
        exit
    fi
    
    echo "Building from $file"
    onWait
    bash $file

    

else
    echo "Build.DO - The other make o.O"
    await
    echo "Version 0.24.22.11"
    await
    echo "-----------------------------"
    await
    echo "build do: building with the make.sh file"
    await
    echo "build clean: Removes the build directory"
    await
    echo "To build, make sure you're root!"
    await

fi