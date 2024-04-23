# Install script for directory: /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/time

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/Andrew/git/croisen/chiyo-tatsu/libs_lin")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_time.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_time.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_time.so.2401.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_time.so.2401.0.0"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/time/libabsl_time.so.2401.0.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_time.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_time.so.2401.0.0")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_time.so.2401.0.0"
         OLD_RPATH "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/time:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/strings:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/numeric:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_time.so.2401.0.0")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/time/libabsl_time.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_civil_time.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_civil_time.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_civil_time.so.2401.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_civil_time.so.2401.0.0"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/time/libabsl_civil_time.so.2401.0.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_civil_time.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_civil_time.so.2401.0.0")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_civil_time.so.2401.0.0")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/time/libabsl_civil_time.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_time_zone.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_time_zone.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_time_zone.so.2401.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_time_zone.so.2401.0.0"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/time/libabsl_time_zone.so.2401.0.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_time_zone.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_time_zone.so.2401.0.0")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_time_zone.so.2401.0.0")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/time/libabsl_time_zone.so")
endif()

