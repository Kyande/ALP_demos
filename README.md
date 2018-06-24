# ALP_demos
Assembly language programming demos.

# Compiling (assembling):
To assemble the program, type nasm -f elf hello.asm
On a 64 bit computer: type nasm -f elf64 hello.asm

# Linking using ld:
type ld -m elf_i386 -s -o hello hello.o
If successful a file named hello.o will be created; otherwise an error will be displayes;
Linking using gcc: this is preferred
type gcc -o hello hello.o

# Running the program:
type ./hello
