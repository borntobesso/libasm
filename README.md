## Libasm

The aim of this project is to get familiar with assembly language.

### ELF file

ELF is short for Executable and Linkable Format. It’s a format used for storing binaries, libraries, and core dumps on disks in Linux and Unix-based systems.

ELF files are for execution or for linking. Depending on the primary goal, it contains the required segments or sections. Segments are viewed by the kernel and mapped into memory (using mmap). Sections are viewed by the linker to create executable code or shared objects.

### System V ABI

> ABI is short for Application Binary Interface and specifies a low-level interface between the operating system and a piece of executable code.

The System V Application Binary Interface is a set of specifications that detail calling conventions, object file formats, executable file formats, dynamic linking semantics, and much more for systems that complies with the X/Open Common Application Environment Specification and the System V Interface Definition. It is today the standard ABI used by the major Unix operating systems such as Linux, the BSD systems, and many others. The Executable and Linkable Format (ELF) is part of the System V ABI.

[System V ABI](https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf)

> Unix System V (pronounced: "System Five") is one of the first commercial versions of the Unix operating system. It was originally developed by AT&T and first released in 1983.

### Calling conventions for x86-64 (AMD 64)

[A guide to linux system calls](https://blog.packagecloud.io/the-definitive-guide-to-linux-system-calls/)
[System call conventions, Stackoverflow](https://stackoverflow.com/questions/2535989/what-are-the-calling-conventions-for-unix-linux-system-calls-and-user-space-f)

### PLT, GOT, PIE

- ASLR (address-space layout randomization) relies on randomizing the base address of things like shared libraries, making return-to-libc attacks more difficult. It is a technique that is used to increase the difficulty of performing a buffer overflow attack that requires the attacker to know the location of an executable in memory.

- GOT(Global Offset Table)
    > Every ELF executable has a section called the Global Offset Table or the GOT for short. This table is responsible for holding the absolute address of functions in shared libraries linked dynamically at runtime.

- PLT(Procedure Linkage Table)
    > Just like the GOT, every ELF executable also has a section called the Procedure Linkage Table or PLT for short. The PLT is sort of like the spring board that allows us to resolve the absolute addresses of shared libraries at runtime.

- PIE(Position Independent Executable)
    > In computing, position-independent code (PIC) or position-independent executable (PIE) is a body of machine code that, being placed somewhere in the primary memory, executes properly regardless of its absolute address. PIC is commonly used for shared libraries, so that the same library code can be loaded at a location in each program's address space where it does not overlap with other memory in use by, for example, other shared libraries.

[How glibc is loaded at runtime](http://dustin.schultz.io/how-is-glibc-loaded-at-runtime.html)

### elf64 Special Symbols and WRT

- ..plt
    > As in elf32, referring to a procedure name using wrt ..plt causes the linker to build a procedure linkage table entry for the symbol, and the reference gives the address of the PLT entry. You can only use this in contexts which would generate a PC-relative relocation normally (i.e. as the destination for CALL or JMP), since ELF contains no relocation type to refer to PLT entries absolutely.

### TEST instruction

`[TEST]` computes the bit-wise logical `AND` of first operand (source 1 operand) and the second operand (source 2 operand) and sets the `SF`, `ZF`, and `PF` status flags according to the result. The result is then discarded.

### __errno_location

The __errno_location() function shall return the address of the errno variable for the current thread.
`int * __errno_location(void);`