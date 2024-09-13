# pong-cpp2

A bare bone implementation of Pong game written in Cpp2 ([Cppfront](https://github.com/hsutter/cppfront/)) with SFML

![out](https://github.com/mrizaln/pong-cpp2/assets/61090869/3186aa19-dacf-41f1-b612-904866f7a85b)

## Dependencies

- C++20 capable compilers
- CMake 3.23+
- Conan 2

## Building

```sh
conan install . --build missing -s build_type=Release
cmake --preset conan-release                              # use conan-default for windows
cmake --build --preset conan-release
```

## Controls

|    Key     | Action                 |
| :--------: | ---------------------- |
|   space    | Start the game         |
|     q      | Quit the game          |
|     r      | Reset the game         |
|     w      | Move left paddle up    |
|     s      | Move left paddle down  |
|  arrow up  | Move right paddle up   |
| arrow down | Move right paddle down |
