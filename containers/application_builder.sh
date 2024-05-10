#! /bin/bash

# conan_server is defined as a service in the docker-compose file.
ARTIFACTORY_URL="conan_server:9300"
ARTIFACTORY_USER="user"
ARTIFACTORY_PASSWORD="pass"

# Add the Artifactory repository to Conan.
conan remote add local_artifactory "http://$ARTIFACTORY_URL" --insert=0
conan user -p $ARTIFACTORY_PASSWORD -r local_artifactory $ARTIFACTORY_USER

# Change to the application directory.
cd /conan_application
mkdir build
cd build

# Check if environment variable is set.
if [ $BUILD_FROM_SOURCE == 1 ]; then
    echo "BUILD_FROM_SOURCE is set."
    conan install .. --build=awesome_library
else
    echo "BUILD_FROM_SOURCE is not set."
    conan install ..  
fi

# Build the application for Linux-clang.
conan build ..
conan package .. --package-folder ../package

# Remove build directory.
cd ..
rm -rf build
