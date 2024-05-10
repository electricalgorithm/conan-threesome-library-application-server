from conans import ConanFile, CMake


class AwesomeAppConan(ConanFile):
    name = "awesome_app"
    version = "1.0"
    license = "<Put the package license here>"
    author = "<Put your name here> <And your email here>"
    url = "<Package recipe repository url here, for issues about the package>"
    description = "<Description of AwesomeApp here>"
    topics = ("<Put some tag here>", "<here>", "<and here>")
    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False], "fPIC": [True, False]}
    default_options = {"shared": False, "fPIC": True}
    generators = "CMakeDeps", "CMakeToolchain"
    exports_sources = "src/*"

    def requirements(self):
        self.requires("awesome_library/1.0@electricalgorithm/stable")

    def build(self):
        cmake = CMake(self)
        cmake.configure(source_folder="src")
        cmake.build()

    def package(self):
        self.copy(self.name, dst="bin", src=self.build_folder, keep_path=False)
        self.copy(f"{self.name}.exe", dst="bin", src=self.build_folder, keep_path=False)

    def package_info(self):
        self.cpp_info.libs = ["awesome_app"]
