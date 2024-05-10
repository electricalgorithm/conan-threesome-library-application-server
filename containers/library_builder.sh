#! /bin/bash

# This script builds the library for Linux-clang and
# Linux-microblaze targets. After building the library, it
# saves it to Conan local cache, and uploads it to the
# Artifactory repository.


# conan_server is defined as a service in the docker-compose file.
ARTIFACTORY_URL="conan_server:9300"
ARTIFACTORY_USER="user"
ARTIFACTORY_PASSWORD="pass"

# Change to the library directory.
cd /conan_library
mkdir build
cd build

# Add the Artifactory repository to Conan.
conan remote add local_artifactory "http://$ARTIFACTORY_URL" --insert=0
conan user -p $ARTIFACTORY_PASSWORD -r local_artifactory $ARTIFACTORY_USER

# Build the library for Linux-clang.
conan install ..
conan build ..
conan export-pkg .. electricalgorithm/stable
conan upload --all --confirm awesome_library/1.0 -r local_artifactory --force
