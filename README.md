# A Threesome to Understand Conan Package Management System

Three actors:
- Conan Artifactory Server: The middleman that stores all the built libraries in the cloud. (conan_server)
- Library Builder: The one who builds the library and push it to the artifactory. (library_builder)
- Application Builder: The consumer who likes use conan as dependency management. (application_builder)

### Run Scenerio
1. Start conan_server by `docker compose run conan_server`
2. Build and publish the library using `docker compose run library_builder`
3. Build the application that requires the library built in previous step with `docker compose run application_builder`
4. Run the application in your Linux host-machine or by using `docker compose run development` and `./conan_application/package/bin/awesome_app`.

### Build from Source and Build using Generated
If you want to build the library before linking it to application set `BUILD_FROM_SOURCE` environment variable to 1, if you want to directly use the compiled files from artifactory use 0.