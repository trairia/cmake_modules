# - Locate GLM library
# This module defines
#  GLM_LIBRARY, the name of the library to link against
#  GLM_FOUND
#  GLM_INCLUDE_DIR, where to find GLM.h
# To Adding search path, set GLM_ROOT_DIR as follows
#    set(GLM_ROOT_DIR "path/to/glm")
# or launch cmake with -DGLM_ROOT_DIR="/path/to/GLM_ROOT_DIR"
#
# author: Kazunori Kimura
# email : kazunori.abu@gmail.com

find_path(GLM_INCLUDE_DIR_TMP glm.hpp
  HINTS ${GLM_ROOT_DIR}
  PATH_SUFFIXES include/glm include
  )

if(${GLM_INCLUDE_DIR_TMP} STREQUAL "GLM_INCLUDE_DIR_TMP-NOTFOUND")
  set(GLM_INCLUDE_DIR ${GLM_INCLUDE_DIR_TMP})
else()
  string(REGEX REPLACE "(.*)/glm" "\\1" GLM_INCLUDE_DIR ${GLM_INCLUDE_DIR_TMP})
endif()

message("-- GLM include directory " ${GLM_INCLUDE_DIR})
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GLM
  REQUIRED_VARS GLM_INCLUDE_DIR)