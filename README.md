# cmake-noweb
CMake and the noweb literate programming tool template. 

This is a barebones example that integrates cmake, noweb, and latex.

This example will build a C executable named 'quant' and will build a pdf named 'cmake-noweb.pdf' in the src/ directory.

Ensure that you have UseLatex.cmake in your cmake modules path (https://cmake.org/Wiki/CMakeUserUseLATEX).

To get started, run

    git clone https://github.com/bdkoepke/cmake-noweb
    mkdir build
    cd build
    cmake ../cmake-noweb && make

If you want more files, add them to the sets in CMakeLists.txt.
