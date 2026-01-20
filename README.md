# EC

A minimal compiler that translates constrained English syntax directly into native x86_64 assembly, without a runtime or libc.

## Motivation

EC is an experiment in compiler design and systems programming.
It explores how far a constrained natural-language syntax can be compiled directly to native assembly without an intermediate runtime, virtual machine, or standard library.

The project is intentionally minimal: no libc, no garbage collector, and no dynamic dispatch. All abstractions are lowered at compile time.
## Features

## Overview

It does not attempt free-form natural language understanding.

Instead, it uses a deterministic, sentence-based grammar designed to remain readable while compiling predictably to assembly.

- **Natural Language Syntax**: Write code in English sentences
- **Compiles to Assembly**: Direct compilation to x86_64 NASM assembly
- **Modular Standard Library**: Only includes what you use (heap, strings, math, io)
- **Automated Memory Management**: Heap allocations are tracked
- **Zero External Dependencies**: No libc required, uses direct syscalls

## Requirements

- Rust (for building the compiler)
- NASM (Netwide Assembler)
- ld (GNU linker)

```bash
# On Debian/Ubuntu
sudo apt install nasm rust make

# On Fedora
sudo yum install nasm rust make
```

## Building

```bash
cargo build --release
```

## Installing

```bash
# Install systemwide
make build
sudo make install

# Uninstall
sudo make uninstall
```

## Usage

```bash
# Compile and run
ec example.en --run

# Compile
ec example.en
```

## Examples

### Hello World
```
Print "Hello, World!".
```

### FizzBuzz-style
```
For each number from 0 to 100, if the number is even print "foo" but if it is odd print "bar".
```

## Architecture

```
Source (.en) → Lexer → Parser → Analyzer → CodeGen → Assembly (.asm)
                                    ↓
                           Dependency Tracking
                                    ↓
                        Modular stdlib inclusion
```

## Standard Library Modules

| Module | Included When |
|--------|---------------|
| core.asm | Always |
| io.asm | Using print |
| heap.asm | Using allocate/free |
| string.asm | Using strings |
| math.asm | Using division/modulo/properties |

## License

GNU General Public License v3.0
