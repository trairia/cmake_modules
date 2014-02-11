# - Locate BULLET library
# This module defines
#  BULLET_LIBRARY, the name of the library to link against
#  BULLET_FOUND
#  BULLET_INCLUDE_DIR, where to find BULLET.h
# To Adding search path, set BULLET_ROOT_DIR as follows
#    set(BULLET_ROOT_DIR "path/to/bullet")
# or launch cmake with -DBULLET_ROOT_DIR="/path/to/BULLET_ROOT_DIR"
#
# author: Kazunori Kimura
# email : kazunori.abu@gmail.com

find_path(BULLET_INCLUDE_DIR btBulletDynamicsCommon.h
  HINTS ${BULLET_ROOT_DIR}
  PATH_SUFFIXES include/bullet bullet include
  )

find_library(BULLET_LIBRARY BulletDynamics
  NAMES BulletDynamics
  HINTS ${BULLET_ROOT_DIR}
  PATH_SUFFIXES lib
  )

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(BULLET
  REQUIRED_VARS BULLET_INCLUDE_DIR BULLET_LIBRARY)