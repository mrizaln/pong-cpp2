from conan import ConanFile
from conan.tools.cmake import cmake_layout


class Recipe(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeToolchain", "CMakeDeps", "VirtualRunEnv"
    requires = ["sfml/2.6.1", "spdlog/1.13.0"]

    def layout(self):
        cmake_layout(self)
