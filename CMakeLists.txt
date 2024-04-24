cmake_minimum_required(VERSION 3.24)
project(pong-cpp2 VERSION 0.0.1)

include(cmake/prelude.cmake)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_COLOR_DIAGNOSTICS ON)

# use mold if it exists in PATH
find_program(MOLD mold)
if(MOLD)
  set(CMAKE_EXE_LINKER_FLAGS "-fuse-ld=mold")
  set(CMAKE_SHARED_LINKER_FLAGS "-fuse-ld=mold")
endif()

find_package(SFML CONFIG REQUIRED)
find_package(spdlog CONFIG REQUIRED)

include(cmake/cppfront.cmake)

set(SOURCES source/main.cpp2 source/pong.h2)

# cmake-format: off
cppfront_compile(main
  INCLUDE_ALL_STD
  SOURCES         ${SOURCES}
  DEPENDS         sfml::sfml spdlog::spdlog
  COMPILE_FLAGS   -Wall -Wextra -Wconversion

  COMPILE_FLAGS   -fsanitize=address,leak,undefined
  LINK_FLAGS      -fsanitize=address,leak,undefined

  # COMPILE_FLAGS -fsanitize=thread
  # LINK_FLAGS    -fsanitize=thread
)
# cmake-format: on
