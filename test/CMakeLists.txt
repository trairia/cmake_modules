cmake_minimum_required(VERSION 2.8)

project(FIND_PKG_TEST)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_BINARY_DIR}/cmake)
set(SOIL_ROOT_DIR)
set(GLM_ROOT_DIR)
find_package(SOIL)
find_package(GLM)
find_package(GLFW)
find_package(OpenGL)
