# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin

# Include any dependencies generated for this target.
include third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/compiler_depend.make

# Include the progress variables for this target.
include third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/progress.make

# Include the compile flags for this target's objects.
include third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/flags.make

third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/internal/demangle.cc.o: third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/flags.make
third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/internal/demangle.cc.o: /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/debugging/internal/demangle.cc
third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/internal/demangle.cc.o: third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/internal/demangle.cc.o"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/debugging && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/internal/demangle.cc.o -MF CMakeFiles/demangle_internal.dir/internal/demangle.cc.o.d -o CMakeFiles/demangle_internal.dir/internal/demangle.cc.o -c /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/debugging/internal/demangle.cc

third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/internal/demangle.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/demangle_internal.dir/internal/demangle.cc.i"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/debugging && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/debugging/internal/demangle.cc > CMakeFiles/demangle_internal.dir/internal/demangle.cc.i

third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/internal/demangle.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/demangle_internal.dir/internal/demangle.cc.s"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/debugging && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/debugging/internal/demangle.cc -o CMakeFiles/demangle_internal.dir/internal/demangle.cc.s

# Object files for target demangle_internal
demangle_internal_OBJECTS = \
"CMakeFiles/demangle_internal.dir/internal/demangle.cc.o"

# External object files for target demangle_internal
demangle_internal_EXTERNAL_OBJECTS =

third_party/abseil-cpp/absl/debugging/libabsl_demangle_internal.so.2401.0.0: third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/internal/demangle.cc.o
third_party/abseil-cpp/absl/debugging/libabsl_demangle_internal.so.2401.0.0: third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/build.make
third_party/abseil-cpp/absl/debugging/libabsl_demangle_internal.so.2401.0.0: third_party/abseil-cpp/absl/base/libabsl_base.so.2401.0.0
third_party/abseil-cpp/absl/debugging/libabsl_demangle_internal.so.2401.0.0: third_party/abseil-cpp/absl/base/libabsl_raw_logging_internal.so.2401.0.0
third_party/abseil-cpp/absl/debugging/libabsl_demangle_internal.so.2401.0.0: third_party/abseil-cpp/absl/base/libabsl_log_severity.so.2401.0.0
third_party/abseil-cpp/absl/debugging/libabsl_demangle_internal.so.2401.0.0: third_party/abseil-cpp/absl/base/libabsl_spinlock_wait.so.2401.0.0
third_party/abseil-cpp/absl/debugging/libabsl_demangle_internal.so.2401.0.0: third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libabsl_demangle_internal.so"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/debugging && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/demangle_internal.dir/link.txt --verbose=$(VERBOSE)
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/debugging && $(CMAKE_COMMAND) -E cmake_symlink_library libabsl_demangle_internal.so.2401.0.0 libabsl_demangle_internal.so.2401.0.0 libabsl_demangle_internal.so

third_party/abseil-cpp/absl/debugging/libabsl_demangle_internal.so: third_party/abseil-cpp/absl/debugging/libabsl_demangle_internal.so.2401.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate third_party/abseil-cpp/absl/debugging/libabsl_demangle_internal.so

# Rule to build all files generated by this target.
third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/build: third_party/abseil-cpp/absl/debugging/libabsl_demangle_internal.so
.PHONY : third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/build

third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/clean:
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/debugging && $(CMAKE_COMMAND) -P CMakeFiles/demangle_internal.dir/cmake_clean.cmake
.PHONY : third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/clean

third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/depend:
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/debugging /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/debugging /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : third_party/abseil-cpp/absl/debugging/CMakeFiles/demangle_internal.dir/depend

