# Install script for directory: /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/base

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_atomic_hook.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_errno_saver.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_log_severity.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_log_severity.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_log_severity.so.2401.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_log_severity.so.2401.0.0"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_log_severity.so.2401.0.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_log_severity.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_log_severity.so.2401.0.0")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_log_severity.so.2401.0.0")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_log_severity.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_no_destructor.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_nullability.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_raw_logging_internal.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_logging_internal.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_logging_internal.so.2401.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_logging_internal.so.2401.0.0"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_raw_logging_internal.so.2401.0.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_logging_internal.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_logging_internal.so.2401.0.0")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_logging_internal.so.2401.0.0"
         OLD_RPATH "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_raw_logging_internal.so.2401.0.0")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_raw_logging_internal.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_spinlock_wait.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_spinlock_wait.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_spinlock_wait.so.2401.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_spinlock_wait.so.2401.0.0"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_spinlock_wait.so.2401.0.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_spinlock_wait.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_spinlock_wait.so.2401.0.0")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_spinlock_wait.so.2401.0.0")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_spinlock_wait.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_config.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_dynamic_annotations.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_core_headers.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_malloc_internal.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_malloc_internal.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_malloc_internal.so.2401.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_malloc_internal.so.2401.0.0"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_malloc_internal.so.2401.0.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_malloc_internal.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_malloc_internal.so.2401.0.0")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_malloc_internal.so.2401.0.0"
         OLD_RPATH "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_malloc_internal.so.2401.0.0")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_malloc_internal.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_base_internal.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_base.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_base.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_base.so.2401.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_base.so.2401.0.0"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_base.so.2401.0.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_base.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_base.so.2401.0.0")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_base.so.2401.0.0"
         OLD_RPATH "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_base.so.2401.0.0")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_base.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_throw_delegate.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_throw_delegate.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_throw_delegate.so.2401.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_throw_delegate.so.2401.0.0"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_throw_delegate.so.2401.0.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_throw_delegate.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_throw_delegate.so.2401.0.0")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_throw_delegate.so.2401.0.0"
         OLD_RPATH "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_throw_delegate.so.2401.0.0")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_throw_delegate.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_pretty_function.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_endian.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_scoped_set_env.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_scoped_set_env.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_scoped_set_env.so.2401.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_scoped_set_env.so.2401.0.0"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_scoped_set_env.so.2401.0.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_scoped_set_env.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_scoped_set_env.so.2401.0.0")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_scoped_set_env.so.2401.0.0"
         OLD_RPATH "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_scoped_set_env.so.2401.0.0")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_scoped_set_env.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_strerror.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_strerror.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_strerror.so.2401.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_strerror.so.2401.0.0"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_strerror.so.2401.0.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_strerror.so.2401.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_strerror.so.2401.0.0")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libabsl_strerror.so.2401.0.0")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/base/libabsl_strerror.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_fast_type_id.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lib/pkgconfig/absl_prefetch.pc")
endif()

