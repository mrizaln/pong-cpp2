include(FetchContent)

FetchContent_Declare(
  cppfront
  GIT_REPOSITORY https://github.com/hsutter/cppfront.git
  GIT_TAG 5663493860a5558a3d64c59ac9ee6f0e26dedf99
  GIT_PROGRESS TRUE)
FetchContent_MakeAvailable(cppfront)

if(NOT cppfront_POPULATED)
  message(FATAL_ERROR "cppfront failed to populate")
endif()

add_library(cppfront_header INTERFACE)
target_include_directories(cppfront_header
                           INTERFACE ${cppfront_SOURCE_DIR}/include)

add_executable(cppfront ${cppfront_SOURCE_DIR}/source/cppfront.cpp)
target_include_directories(cppfront PRIVATE ${cppfront_SOURCE_DIR}/source)

set(CPPFRONT_BINARY $<TARGET_FILE:cppfront>)
message(STATUS "cppfront binary: ${CPPFRONT_BINARY}")

set(CPPFRONT_GENERATED_DIR ${CMAKE_CURRENT_BINARY_DIR}/generated)

#
# transpile c++2 to c++ then compile
#
function(cppfront_compile NAME)
  cmake_parse_arguments(ARGS "INCLUDE_ALL_STD" ""
                        "SOURCES;DEPENDS;COMPILE_FLAGS;LINK_FLAGS" ${ARGN})

  if(ARGS_UNPARSED_ARGUMENTS)
    message(
      FATAL_ERROR
        "cppfront_compile: Unrecognized arguments: ${ARGS_UNPARSED_ARGUMENTS}")
  endif()

  message(STATUS "[cppfront_compile] sources: ${ARGS_SOURCES}")

  set(CPPFRONT_BINARY_FLAG "")
  if(CPPFRONT_INCLUDE_ALL_STD)
    set(CPPFRONT_BINARY_FLAG "-include-std")
  endif()

  set(GENERATED_SOURCES "")

  foreach(SOURCE ${ARGS_SOURCES})
    get_filename_component(SOURCE_EXT ${SOURCE} EXT)
    get_filename_component(SOURCE_NAME ${SOURCE} NAME_WE)

    if(SOURCE_EXT STREQUAL ".cpp2")
      set(SOURCE_EXT ".cpp")
    elseif(SOURCE_EXT STREQUAL ".h2")
      set(SOURCE_EXT ".h")
    else()
      message(
        FATAL_ERROR "cppfront_compile: Unknown source extension: ${SOURCE}")
    endif()

    set(GENERATED_SOURCE ${CPPFRONT_GENERATED_DIR}/${SOURCE_NAME}${SOURCE_EXT})
    file(REAL_PATH ${SOURCE} SOURCE_REALPATH)

    add_custom_command(
      OUTPUT ${GENERATED_SOURCE}
      COMMAND ${CPPFRONT_BINARY} ${CPPFRONT_BINARY_FLAG} ${SOURCE_REALPATH} -o
              ${GENERATED_SOURCE}
      DEPENDS ${CPPFRONT_BINARY} ${SOURCE_REALPATH} ${ARGS_DEPENDS})

    list(APPEND GENERATED_SOURCES ${GENERATED_SOURCE})
  endforeach()

  message(STATUS "[cppfront_compile] generated sources: ${GENERATED_SOURCES}")

  add_executable(${NAME} ${GENERATED_SOURCES})
  target_link_libraries(${NAME} PRIVATE cppfront_header)
  target_link_libraries(${NAME} PRIVATE ${ARGS_DEPENDS})
  target_compile_options(${NAME} PRIVATE ${ARGS_COMPILE_FLAGS})
  target_link_options(${NAME} PRIVATE ${ARGS_LINK_FLAGS})
endfunction()
