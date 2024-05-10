#!/bin/bash

echo "Creating environment..."
mkdir -p /var/conan_server > /dev/null 2>&1
cd /var/conan_server > /dev/null 2>&1
python3 -m venv .venv > /dev/null 2>&1
source .venv/bin/activate > /dev/null 2>&1

echo "Installing conan server..."
pip install conan==1.59 > /dev/null 2>&1

echo "Starting conan server..."
conan_server