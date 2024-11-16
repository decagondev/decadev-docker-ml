# 🛠️ Advanced Development & Reverse Engineering Environment

> 🔬 A professional-grade Docker environment for systems programming, reverse engineering, binary analysis, and secure development.

[![Docker Required](https://img.shields.io/badge/Docker-Required-blue?logo=docker)](https://docs.docker.com/get-docker/)
[![NeoVim](https://img.shields.io/badge/NeoVim-LazyVim-green?logo=neovim)](https://www.lazyvim.org/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

## 📋 Overview

This project provides a comprehensive, containerized development environment specifically designed for:
- 🔒 Security Research & Reverse Engineering
- 💻 Systems Programming & Low-level Development
- 🐞 Binary Analysis & Debugging
- 🔧 Cross-architecture Development
- 🖥️ Operating System Development

---

## ✨ Features & Tools

### 🎯 Core Development Environment

#### 📝 NeoVim + LazyVim
- Modern, blazingly fast text editor
- Full LSP (Language Server Protocol) support
- Integrated terminal
- Git integration
- Fuzzy finding
- File tree explorer
- Auto-completion
- Syntax highlighting
- Custom keybindings
- Extensible plugin system

#### 🛠️ Compilers & Languages
- **GCC/G++**
  - 32-bit & 64-bit support
  - Multi-lib capabilities
- **Clang/LLVM**
  - Alternative compiler toolchain
  - Static analysis tools
- **Rust**
  - Systems programming
  - Cross-compilation support
- **Go**
  - Modern systems programming
  - Network tool development
- **NASM**
  - x86/x64 assembly development
  - Bootloader development

### 🔍 Reverse Engineering Tools

#### Analysis Frameworks
- **Radare2**
  - Binary analysis
  - Disassembly
  - Debugging capabilities
  - Scripting support
- **GDB Enhanced Features (GEF)**
  - Advanced debugging
  - Exploit development
  - Memory analysis
- **PwnDBG**
  - Alternative GDB enhancement
  - Exploit development features

#### Binary Analysis
- **Binwalk**
  - Firmware analysis
  - File system extraction
- **ROPgadget**
  - ROP chain discovery
  - Exploit development
- **Frida**
  - Dynamic instrumentation
  - Runtime analysis

#### Python Security Tools
- **Pwntools**
  - Exploit development
  - CTF toolkit
- **Angr**
  - Binary analysis
  - Symbolic execution
- **Volatility3**
  - Memory forensics
  - Process analysis

### 💻 Low-Level Development

#### System Tools
- **QEMU**
  - System emulation
  - Architecture simulation
- **GRUB**
  - Bootloader development
  - OS development
- **xorriso**
  - ISO creation
  - Boot image manipulation

#### Debugging & Tracing
- **ltrace**
  - Library call tracing
- **strace**
  - System call tracing
- **gdb-multiarch**
  - Cross-architecture debugging

---

## 🚀 Getting Started

### Prerequisites
- Docker Desktop installed
- Git (optional)
- 4GB+ RAM recommended
- 10GB+ free disk space

### 🐳 Quick Start

1. **Clone the Repository**
```bash
git clone https://github.com/yourusername/dev-environment.git
cd dev-environment
```

2. **Build the Container**
```bash
docker build -t dev-environment .
```

3. **Run the Environment**
```bash
docker run -it -v $(pwd):/workdir dev-environment
```

4. **Verify Installation**
```bash
# Check NeoVim
nvim --version

# Check GCC
gcc --version

# Check Radare2
r2 -v
```

---

## 💡 Usage Guide

### 🖥️ NeoVim/LazyVim Basics

#### Essential Keybindings
```
Leader Key = <Space>

# File Operations
<Space>ff    - Find files
<Space>fg    - Live grep
<Space>e     - File explorer
<Space>w     - Save file
<Space>q     - Close window

# Code Navigation
gd           - Go to definition
gr           - Find references
K            - Show documentation
<Space>ca    - Code actions

# Terminal
<Space>ft    - Float terminal
<C-\>        - Toggle terminal

# Git
<Space>gg    - Lazygit
<Space>gj    - Next hunk
<Space>gk    - Prev hunk

# LSP
<Space>lr    - Rename
<Space>lf    - Format
<Space>la    - Code actions
```

### 🔧 Development Workflows

#### C/C++ Development
```bash
# Compile 32-bit
gcc -m32 -o program32 program.c

# Compile 64-bit
gcc -m64 -o program64 program.c

# Debug with GDB
gdb ./program
```

#### Assembly Development
```bash
# Compile assembly
nasm -f elf64 code.asm -o code.o
ld code.o -o program

# Debug assembly
gdb ./program
```

#### Reverse Engineering
```bash
# Basic analysis
r2 -A ./binary
aaa        # Analyze all
afl        # List functions
s main     # Seek to main
pdf        # Print disassembly

# Memory analysis
gdb ./program
gef> checksec
gef> vmmap
gef> heap
```

---

## 🗂️ Project Structure

```
/
├── Dockerfile          # Container definition
├── README.md          # This file
├── config/            # Tool configurations
│   ├── nvim/          # NeoVim/LazyVim config
│   └── gdb/           # GDB/GEF config
├── scripts/           # Utility scripts
└── workdir/           # Mounted work directory
```

## 🔧 Customization

### Adding New Tools
1. Edit `Dockerfile`
2. Add required packages
3. Rebuild container

### NeoVim Configuration
- Config location: `~/.config/nvim/`
- Add plugins: Edit `lua/config/lazy.lua`
- Custom keymaps: Edit `lua/config/keymaps.lua`

---

## 🐛 Troubleshooting

### Common Issues

1. **Docker Permission Errors**
```bash
sudo usermod -aG docker $USER
newgrp docker
```

2. **NeoVim Plugin Issues**
```bash
# Clear plugin cache
rm -rf ~/.local/share/nvim
# Reinstall plugins
:Lazy sync
```

3. **GDB Issues**
```bash
# Reinstall GEF
wget -O ~/.gdbinit-gef.py -q https://gef.blah.cat/py
# Source configuration
source ~/.gdbinit-gef.py
```

---

## 📚 Resources

- [LazyVim Documentation](https://www.lazyvim.org/)
- [Radare2 Book](https://book.rada.re/)
- [GEF Documentation](https://gef.readthedocs.io/)
- [Docker Documentation](https://docs.docker.com/)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Community

- 🌟 Star this repository if you find it helpful!
- 🐛 Report issues in the issue tracker
- 💡 Submit feature requests
- 🤝 Fork and contribute

---

📝 **Created and maintained by Tom Tarpey**  
🔄 Last updated: November 2024
