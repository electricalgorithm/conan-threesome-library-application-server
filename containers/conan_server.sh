#!/bin/bash

echo "Creating environment..."
mkdir -p /var/conan_server > /dev/null 2>&1
cd /var/conan_server > /dev/null 2>&1
python3 -m venv .venv > /dev/null 2>&1
source .venv/bin/activate > /dev/null 2>&1

echo "Installing conan server..."
pip install conan==1.59 > /dev/null 2>&1

echo "Configuring conan server..."
conan_server & > /dev/null 2>&1
app_pid=$!
sleep 1
kill -9 $app_pid > /dev/null 2>&1
SERVER_CONF_PATH="/root/.conan_server/server.conf"
sed -i 's/host_name: localhost/host_name: conan_server/' $SERVER_CONF_PATH
sed -i '/\[write_permissions\]/a */*@*/*: *' $SERVER_CONF_PATH
sed -i '/\[users\]/a user: pass' $SERVER_CONF_PATH
echo "Configured conan server."

echo "Starting conan server..."
conan_server