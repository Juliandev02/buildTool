# Build - A tool to Build files OWO
=> Germany

Mit diesen Tool könnt ihr wie bei make, etwas bauen-/kompilieren.
Dazu braucht ihr in der Regel nicht mehr als ein paar Kommandos. Wichtig ist:
- Das der Build File Name (Makefile bei make) make.sh heißen MUSS. Ansonsten geht das nicht

Um bspw. meinen eigenen Kernel zu kompilieren, sieht mein Code so aus. Achja, was im makefile drinne steht, muss in der Bash-Syntax sein. If und Else wären sehr unpraktisch:

``
#!/bin/bash

mkdir build
nasm -f elf64 header.asm -o build/header.o
nasm -f elf64 kernel.asm -o build/kernel.o
ld --nmagic --output=build/kernel --script=linker.ld build/header.o build/kernel.o
``
