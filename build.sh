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

function program.onBuild() {
    shc -f build.sh
    mv build.sh.x build
    rm build.sh.x.c
}

function program.onBuild.execLinux() {
    shc -f build.sh
    mv build.sh.x build.start
    rm build.sh.x.c
}


# Clean Builddir
if [[ $1 == "clean" ]]; then
    echo "Removing build directory..."

    # Root required
    if [[ $(id -u) != 0 ]]; then
        echo "To build, make sure you're root!"
    exit
    fi

    if [ ! -d "./build/" ]; then
    sleep 0.3
        echo "build-directory does not exists. Terminating"
        exit
    fi

    onRemove


# Building
elif [[ $1 == "do" ]]; then
    echo "Building..."

    # Root required
    if [[ $(id -u) != 0 ]]; then
        echo "To build, make sure you're root!"
    exit
    fi

    if [ ! -f "./make.sh" ]; then
        sleep 0.7
        echo "make.sh does not exists. Terminating"
        exit
    fi
    
    onBuild


# Building from a other makefile
elif [[ $1 = "makefile" ]]; then
    echo "Building from file..."

    # Root required
    if [[ $(id -u) != 0 ]]; then
        echo "To build, make sure you're root!"
    exit
    fi

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


# Configurations
elif [[ $1 = "config" ]]; then

    if [[ $2 = "write" ]]; then
        read -ep "Input Builddir here: " -i " " cfg

        echo "$cfg" > "./config.cfg"
        for line in ${line}; do
           echo "${line}" >> "./config.cfg"
        done

    elif [[ $2 = "read" ]]; then
        cat "./config.cfg" | while read line; do
            echo "${line}"
        done

    else
        echo "build config read: reads the cfg"
        echo "build config write @input: writes in the cfg"

fi

# Program Informations and Buildings
elif [[ $1 = "program" ]]; then

    # Root required
    if [[ $(id -u) != 0 ]]; then
        echo "To build, make sure you're root!"
    exit
    fi

    if [[ $2 = "build" ]]; then
        program.onBuild

    elif [[ $2 = "build-startImage" ]]; then
        program.onBuild.execLinux

    elif [[ $2 = "ver" ]] || [[ $2 = "version" ]]; then
        echo "Build Version 0.26.12.99"

    else
        echo "build program build: building the .sh file"
        echo "build program build-startImage: building the .sh file to a .start file"
        echo "build program ver @or version: Shows the Version"

fi

# Program giving without arguments
else

    echo "Build.DO - The other make o.O"
    echo "Version 0.26.12.99"
    echo "-----------------------------"
    echo "build do: building with the make.sh file"
    echo "build clean: Removes the build directory"
    echo "build config: configures the cfg file"
    echo "build program: Show informations about the program and something else"
    echo "To build, make sure you're root!"

fi
