# pong-cpp2

A bare bone implementation of Pong game written in Cpp2 ([Cppfront](https://github.com/hsutter/cppfront/)) with SFML

![out](https://github.com/mrizaln/pong-cpp2/assets/61090869/3186aa19-dacf-41f1-b612-904866f7a85b)

## Dependencies

- C++20 capable compilers
- CMake 3.23+

## Building

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release      # -G Ninja
cmake --build build
```

Then run the executable:

```sh
./build/pong
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
