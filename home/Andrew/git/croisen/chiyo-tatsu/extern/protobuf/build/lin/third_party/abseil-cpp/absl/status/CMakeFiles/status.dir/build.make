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
include third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/compiler_depend.make

# Include the progress variables for this target.
include third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/progress.make

# Include the compile flags for this target's objects.
include third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/flags.make

third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/internal/status_internal.cc.o: third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/flags.make
third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/internal/status_internal.cc.o: /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/status/internal/status_internal.cc
third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/internal/status_internal.cc.o: third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/internal/status_internal.cc.o"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/internal/status_internal.cc.o -MF CMakeFiles/status.dir/internal/status_internal.cc.o.d -o CMakeFiles/status.dir/internal/status_internal.cc.o -c /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/status/internal/status_internal.cc

third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/internal/status_internal.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/status.dir/internal/status_internal.cc.i"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/status/internal/status_internal.cc > CMakeFiles/status.dir/internal/status_internal.cc.i

third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/internal/status_internal.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/status.dir/internal/status_internal.cc.s"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/status/internal/status_internal.cc -o CMakeFiles/status.dir/internal/status_internal.cc.s

third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status.cc.o: third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/flags.make
third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status.cc.o: /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/status/status.cc
third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status.cc.o: third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status.cc.o"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status.cc.o -MF CMakeFiles/status.dir/status.cc.o.d -o CMakeFiles/status.dir/status.cc.o -c /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/status/status.cc

third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/status.dir/status.cc.i"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/status/status.cc > CMakeFiles/status.dir/status.cc.i

third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/status.dir/status.cc.s"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/status/status.cc -o CMakeFiles/status.dir/status.cc.s

third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status_payload_printer.cc.o: third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/flags.make
third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status_payload_printer.cc.o: /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/status/status_payload_printer.cc
third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status_payload_printer.cc.o: third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status_payload_printer.cc.o"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status_payload_printer.cc.o -MF CMakeFiles/status.dir/status_payload_printer.cc.o.d -o CMakeFiles/status.dir/status_payload_printer.cc.o -c /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/status/status_payload_printer.cc

third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status_payload_printer.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/status.dir/status_payload_printer.cc.i"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/status/status_payload_printer.cc > CMakeFiles/status.dir/status_payload_printer.cc.i

third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status_payload_printer.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/status.dir/status_payload_printer.cc.s"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/status/status_payload_printer.cc -o CMakeFiles/status.dir/status_payload_printer.cc.s

# Object files for target status
status_OBJECTS = \
"CMakeFiles/status.dir/internal/status_internal.cc.o" \
"CMakeFiles/status.dir/status.cc.o" \
"CMakeFiles/status.dir/status_payload_printer.cc.o"

# External object files for target status
status_EXTERNAL_OBJECTS =

third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/internal/status_internal.cc.o
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status.cc.o
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/status_payload_printer.cc.o
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/build.make
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/strings/libabsl_cord.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/base/libabsl_strerror.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/types/libabsl_bad_optional_access.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/strings/libabsl_cordz_info.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/strings/libabsl_cord_internal.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/strings/libabsl_cordz_functions.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/profiling/libabsl_exponential_biased.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/strings/libabsl_cordz_handle.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/synchronization/libabsl_synchronization.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/debugging/libabsl_stacktrace.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/debugging/libabsl_symbolize.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/debugging/libabsl_debugging_internal.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/debugging/libabsl_demangle_internal.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/synchronization/libabsl_graphcycles_internal.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/base/libabsl_malloc_internal.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/synchronization/libabsl_kernel_timeout_internal.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/time/libabsl_time.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/time/libabsl_civil_time.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/time/libabsl_time_zone.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/crc/libabsl_crc_cord_state.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/crc/libabsl_crc32c.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/strings/libabsl_str_format_internal.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/strings/libabsl_strings.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/strings/libabsl_strings_internal.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/strings/libabsl_string_view.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/base/libabsl_throw_delegate.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/numeric/libabsl_int128.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/crc/libabsl_crc_internal.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/crc/libabsl_crc_cpu_detect.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/base/libabsl_base.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/base/libabsl_raw_logging_internal.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/base/libabsl_log_severity.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/base/libabsl_spinlock_wait.so.2401.0.0
third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0: third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared library libabsl_status.so"
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/status.dir/link.txt --verbose=$(VERBOSE)
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status && $(CMAKE_COMMAND) -E cmake_symlink_library libabsl_status.so.2401.0.0 libabsl_status.so.2401.0.0 libabsl_status.so

third_party/abseil-cpp/absl/status/libabsl_status.so: third_party/abseil-cpp/absl/status/libabsl_status.so.2401.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate third_party/abseil-cpp/absl/status/libabsl_status.so

# Rule to build all files generated by this target.
third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/build: third_party/abseil-cpp/absl/status/libabsl_status.so
.PHONY : third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/build

third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/clean:
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status && $(CMAKE_COMMAND) -P CMakeFiles/status.dir/cmake_clean.cmake
.PHONY : third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/clean

third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/depend:
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/third_party/abseil-cpp/absl/status /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : third_party/abseil-cpp/absl/status/CMakeFiles/status.dir/depend

