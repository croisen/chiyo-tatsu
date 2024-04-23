# Install script for directory: /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/container

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_btree.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_compressed_tuple.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_fixed_array.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_inlined_vector_internal.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_inlined_vector.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_test_allocator.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_flat_hash_map.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_flat_hash_set.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_node_hash_map.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_node_hash_set.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_container_memory.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_hash_function_defaults.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_hash_policy_traits.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_common_policy_traits.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_hashtablez_sampler.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_hashtablez_sampler.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_hashtablez_sampler.so.2401.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_hashtablez_sampler.so.2401.0.0"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/container/libabsl_hashtablez_sampler.so.2401.0.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_hashtablez_sampler.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_hashtablez_sampler.so.2401.0.0")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_hashtablez_sampler.so.2401.0.0"
         OLD_RPATH "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/profiling:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/synchronization:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/time:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/debugging:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/strings:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/numeric:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_hashtablez_sampler.so.2401.0.0")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/container/libabsl_hashtablez_sampler.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_hashtable_debug.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_hashtable_debug_hooks.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_node_slot_policy.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_raw_hash_map.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_container_common.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_raw_hash_set.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_hash_set.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_hash_set.so.2401.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_hash_set.so.2401.0.0"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/container/libabsl_raw_hash_set.so.2401.0.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_hash_set.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_hash_set.so.2401.0.0")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_hash_set.so.2401.0.0"
         OLD_RPATH "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/hash:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/container:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/types:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/profiling:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/synchronization:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/debugging:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/time:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/strings:/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/numeric:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_hash_set.so.2401.0.0")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/container/libabsl_raw_hash_set.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_layout.pc")
endif()

