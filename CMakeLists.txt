cmake_minimum_required(VERSION 3.23)
project(pong-cpp2 VERSION 0.0.1)

include(cmake/prelude.cmake)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_COLOR_DIAGNOSTICS ON)

include(cmake/fetched-libs.cmake) # sfml
include(cmake/cppfront.cmake)

set(SOURCES source/main.cpp2 source/pong.h2)

# cmake-format: off
cppfront_compile(pong
  INCLUDE_ALL_STD
  SOURCES         ${SOURCES}
  DEPENDS         SFML::Window SFML::Graphics
  COMPILE_FLAGS   -Wall -Wextra -Wconversion

  # COMPILE_FLAGS   -fsanitize=address,leak,undefined
  # LINK_FLAGS      -fsanitize=address,leak,undefined

  # COMPILE_FLAGS -fsanitize=thread
  # LINK_FLAGS    -fsanitize=thread
)
# cmake-format: on
