#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Setting up development environment...${NC}"

mkdir -p ~/.config/nvim
mkdir -p ~/.local/share/nvim
mkdir -p ~/workdir

echo -e "${YELLOW}Copying configurations...${NC}"
cp -r config/nvim/* ~/.config/nvim/
cp config/gdb/gdbinit ~/.gdbinit

echo -e "${YELLOW}Installing NeoVim plugins...${NC}"
nvim --headless -c 'autocmd User LazySync quitall' -c 'Lazy sync'

echo -e "${YELLOW}Setting up Python development tools...${NC}"
pip3 install --user pynvim
pip3 install --user debugpy

echo -e "${YELLOW}Setting up additional development tools...${NC}"
cargo install ripgrep
cargo install fd-find

echo -e "${GREEN}Setup complete!${NC}"
