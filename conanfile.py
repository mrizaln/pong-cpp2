from conan import ConanFile


class Recipe(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeToolchain", "CMakeDeps", "VirtualRunEnv"
    requires = ["sfml/2.6.1", "spdlog/1.13.0"]

    def layout(self):
        self.folders.generators = "conan"
