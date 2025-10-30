set(FETCHCONTENT_QUIET FALSE)

include(FetchContent)

# sfml
# ~~~~~~~
FetchContent_Declare(
  sfml
  URL https://github.com/SFML/SFML/releases/download/3.0.2/SFML-3.0.2-Linux.GCC.tar.gz
  URL_HASH SHA256=f916881c4d4349e83122a02607cf201fce30bf1cfeebdf2ab4ca63b1226e30b9
  DOWNLOAD_EXTRACT_TIMESTAMP ON)
FetchContent_MakeAvailable(sfml)

set(SFML_STATIC_LIBRARIES ON)
find_package(SFML COMPONENTS Window Graphics PATHS "${sfml_SOURCE_DIR}/lib/cmake/SFML")
# ~~~~~~~
