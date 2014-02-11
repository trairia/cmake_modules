# - Locate SOIL library
# This module defines
#  SOIL_LIBRARY, the name of the library to link against
#  SOIL_FOUND
#  SOIL_INCLUDE_DIR, where to find SOIL.h
find_path(SOIL_INCLUDE_DIR SOIL.h
  HINTS ${SOIL_ROOT_DIR}
  PATH_SUFFIXES include/SOIL include
  )

message("-- SOIL include dirctory  " ${SOIL_INCLUDE_DIR})

find_library(SOIL_LIBRARY
  NAMES SOIL
  HINTS ${SOIL_ROOT_DIR}
  PATH_SUFFIXES lib
  )

message("-- SOIL Library  " ${SOIL_LIBRARY})

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SOIL
                                  REQUIRED_VARS SOIL_LIBRARY SOIL_INCLUDE_DIR)
