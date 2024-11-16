#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

function check_binary() {
  if ! [ -f "$1" ]; then
    echo -e "${RED}Error: Binary $1 not found${NC}"
    exit 1
  fi

  if ! [ -x "$1" ]; then
    echo -e "${YELLOW}Warning: $1 is not executable${NC}"
    chmod +x "$1"
  fi
}

function analyze_binary() {
  local binary=$1
  echo -e "${GREEN}Analyzing binary: $binary${NC}"

  echo -e "${YELLOW}File information:${NC}"
  file "$binary"

  echo -e "\n${YELLOW}Security checks:${NC}"
  checksec --file="$binary"

  echo -e "\n${YELLOW}Dependencies:${NC}"
  ldd "$binary"

  echo -e "\n${YELLOW}Symbols:${NC}"
  nm -C "$binary" 2>/dev/null || echo "No symbols found"
}

function start_debug() {
  local binary=$1
  local args=${@:2}

  echo -e "${GREEN}Starting GDB with GEF...${NC}"
  echo -e "${YELLOW}Target: $binary${NC}"
  echo -e "${YELLOW}Arguments: $args${NC}"

  gdb -q "$binary" --args "$binary" $args
}

if [ $# -lt 1 ]; then
  echo "Usage: $0 <binary> [args...]"
  exit 1
fi

check_binary "$1"
analyze_binary "$1"
start_debug "$@"
