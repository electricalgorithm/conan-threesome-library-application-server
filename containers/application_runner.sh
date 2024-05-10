#! /bin/bash

# conan_server is defined as a service in the docker-compose file.
ARTIFACTORY_URL="conan_server:9300"
ARTIFACTORY_USER="user"
ARTIFACTORY_PASSWORD="pass"

# Add the Artifactory repository to Conan.
echo "Adding Artifactory repository to Conan..."
conan remote add local_artifactory "http://$ARTIFACTORY_URL" --insert=0 > /dev/null 2>&1
conan user -p $ARTIFACTORY_PASSWORD -r local_artifactory $ARTIFACTORY_USER > /dev/null 2>&1

# Install the application.
echo "Installing the application..."
conan install awesome_app/1.0@electricalgorithm/stable -g virtualrunenv > /dev/null 2>&1

# Run the application.
echo "Running the application..."
source activate_run.sh > /dev/null 2>&1
echo
awesome_app
source deactivate_run.sh > /dev/null 2>&1