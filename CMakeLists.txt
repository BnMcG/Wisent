cmake_minimum_required(VERSION 3.6)
project(wisent)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES
        ast.cpp
        ast.hpp
        makefile
        source.w
        wisent.lex
        wisent.tab.cpp
        wisent.tab.hpp
        wisent.y
        wisent.yy.cpp)

add_executable(wisent ${SOURCE_FILES})