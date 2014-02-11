# - Locate GLFW library
# This module defines
#  GLFW_LIBRARY, the name of the library to link against
#  GLFW_FOUND
#  GLFW_INCLUDE_DIR, where to find GL/glfw.h
# To Adding search path, set GLFW_ROOT_DIR as follows
#    set(GLFW_ROOT_DIR "path/to/glfw")
# or launch cmake with -DGLFW_ROOT_DIR="/path/to/GLFW_ROOT_DIR"
#
# author: Kazunori Kimura
# email : kazunori.abu@gmail.com

find_path(GLFW_INCLUDE_DIR_TMP glfw.h
  HINTS ${GLFW_ROOT_DIR}
  PATH_SUFFIXES include/GL include
  )

if(${GLFW_INCLUDE_DIR_TMP} STREQUAL "GLFW_INCLUDE_DIR_TMP-NOTFOUND")
  set(GLFW_INCLUDE_DIR ${GLFW_INCLUDE_DIR_TMP})
else()
  string(REGEX REPLACE "(.*)/GL" "\\1" GLFW_INCLUDE_DIR ${GLFW_INCLUDE_DIR_TMP})
endif()

unset(GLFW_INCLUDE_DIR_TMP)
message("-- GLFW include directory " ${GLFW_INCLUDE_DIR})

find_library(GLFW_LIBRARY
  NAMES glfw
  HINTS ${GLFW_ROOT_DIR}
  PATH_SUFFIXES lib
  )

set(GLFW_HEADER "${GLFW_INCLUDE_DIR}/GL/glfw.h")
if(GLFW_INCLUDE_DIR AND EXISTS "${GLFW_HEADER}")
  file(STRINGS "${GLFW_HEADER}" GLFW_VERSION_MAJOR_LINE REGEX "^#define[ \t]+GLFW_VERSION_MAJOR[ \t]+[0-9]+$")
  file(STRINGS "${GLFW_HEADER}" GLFW_VERSION_MINOR_LINE REGEX "^#define[ \t]+GLFW_VERSION_MINOR[ \t]+[0-9]+$")
  file(STRINGS "${GLFW_HEADER}" GLFW_VERSION_REV_LINE REGEX   "^#define[ \t]+GLFW_VERSION_REVISION[ \t]+[0-9]+$")
  string(REGEX REPLACE "^#define[ \t]+GLFW_VERSION_MAJOR[ \t]+([0-9]+)$" "\\1" GLFW_VERSION_MAJOR "${GLFW_VERSION_MAJOR_LINE}")
  string(REGEX REPLACE "^#define[ \t]+GLFW_VERSION_MINOR[ \t]+([0-9]+)$" "\\1" GLFW_VERSION_MINOR "${GLFW_VERSION_MINOR_LINE}")
  string(REGEX REPLACE "^#define[ \t]+GLFW_VERSION_REVISION[ \t]+([0-9]+)$" "\\1" GLFW_VERSION_REV "${GLFW_VERSION_REV_LINE}")
  set(GLFW_VERSION_STRING ${GLFW_VERSION_MAJOR}.${GLFW_VERSION_MINOR}.${GLFW_VERSION_REV})
  unset(GLFW_VERSION_MAJOR_LINE)
  unset(GLFW_VERSION_MINOR_LINE)
  unset(GLFW_VERSION_REV_LINE)
  unset(GLFW_VERSION_MAJOR)
  unset(GLFW_VERSION_MINOR)
  unset(GLFW_VERSION_REV)
endif()
if(GLFW_VERSION_STRING)
  message("-- GLFW version " ${GLFW_VERSION_STRING})
endif()
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GLFW
  REQUIRED_VARS GLFW_INCLUDE_DIR GLFW_LIBRARY
  VERSION_VAR GLFW_VERSION_STRING)