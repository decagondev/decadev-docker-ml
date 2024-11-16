#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

function analyze_with_radare2() {
  local binary=$1
  echo -e "${YELLOW}Analyzing with Radare2...${NC}"

  cat >/tmp/r2script <<EOF
aaa
afl
pdf@main
iz
EOF

  r2 -q -i /tmp/r2script "$binary"
  rm /tmp/r2script
}

function find_rop_gadgets() {
  local binary=$1
  echo -e "${YELLOW}Finding ROP gadgets...${NC}"
  ROPgadget --binary "$binary" --only "mov|pop|ret|syscall"
}

function analyze_strings() {
  local binary=$1
  echo -e "${YELLOW}Extracting strings...${NC}"
  strings -a -n 8 "$binary" | sort -u
}

function memory_map() {
  local binary=$1
  echo -e "${YELLOW}Creating memory map...${NC}"

  "$binary" &
  pid=$!
  sleep 1

  pmap -x $pid

  kill $pid 2>/dev/null
}

if [ $# -ne 1 ]; then
  echo "Usage: $0 <binary>"
  exit 1
fi

if ! [ -f "$1" ]; then
  echo -e "${RED}Error: Binary not found${NC}"
  exit 1
fi

echo -e "${GREEN}Starting analysis of: $1${NC}"

analyze_with_radare2 "$1"
find_rop_gadgets "$1"
analyze_strings "$1"
memory_map "$1"

echo -e "${GREEN}Analysis complete!${NC}"
