#!/bin/bash

mkdir build

nasm -f elf64 header.asm -o build/header.o
nasm -f elf64 kernel.asm -o build/kernel.o

ld --nmagic --output=build/kernel --script=linker.ld build/header.o build/kernel.o
