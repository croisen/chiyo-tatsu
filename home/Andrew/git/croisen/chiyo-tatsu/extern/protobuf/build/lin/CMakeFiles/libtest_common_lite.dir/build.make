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
include CMakeFiles/libtest_common_lite.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/libtest_common_lite.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/libtest_common_lite.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/libtest_common_lite.dir/flags.make

google/protobuf/map_lite_unittest.pb.h: /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src/google/protobuf/map_lite_unittest.proto
google/protobuf/map_lite_unittest.pb.h: protoc-28.0.0
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running cpp protocol buffer compiler on /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src/google/protobuf/map_lite_unittest.proto"
	./protoc --cpp_out :/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin -I /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src/google/protobuf/map_lite_unittest.proto

google/protobuf/map_lite_unittest.pb.cc: google/protobuf/map_lite_unittest.pb.h
	@$(CMAKE_COMMAND) -E touch_nocreate google/protobuf/map_lite_unittest.pb.cc

google/protobuf/unittest_import_lite.pb.h: /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src/google/protobuf/unittest_import_lite.proto
google/protobuf/unittest_import_lite.pb.h: protoc-28.0.0
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Running cpp protocol buffer compiler on /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src/google/protobuf/unittest_import_lite.proto"
	./protoc --cpp_out :/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin -I /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src/google/protobuf/unittest_import_lite.proto

google/protobuf/unittest_import_lite.pb.cc: google/protobuf/unittest_import_lite.pb.h
	@$(CMAKE_COMMAND) -E touch_nocreate google/protobuf/unittest_import_lite.pb.cc

google/protobuf/unittest_import_public_lite.pb.h: /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src/google/protobuf/unittest_import_public_lite.proto
google/protobuf/unittest_import_public_lite.pb.h: protoc-28.0.0
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Running cpp protocol buffer compiler on /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src/google/protobuf/unittest_import_public_lite.proto"
	./protoc --cpp_out :/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin -I /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src/google/protobuf/unittest_import_public_lite.proto

google/protobuf/unittest_import_public_lite.pb.cc: google/protobuf/unittest_import_public_lite.pb.h
	@$(CMAKE_COMMAND) -E touch_nocreate google/protobuf/unittest_import_public_lite.pb.cc

google/protobuf/unittest_lite.pb.h: /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src/google/protobuf/unittest_lite.proto
google/protobuf/unittest_lite.pb.h: protoc-28.0.0
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Running cpp protocol buffer compiler on /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src/google/protobuf/unittest_lite.proto"
	./protoc --cpp_out :/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin -I /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/src/google/protobuf/unittest_lite.proto

google/protobuf/unittest_lite.pb.cc: google/protobuf/unittest_lite.pb.h
	@$(CMAKE_COMMAND) -E touch_nocreate google/protobuf/unittest_lite.pb.cc

CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.o: CMakeFiles/libtest_common_lite.dir/flags.make
CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.o: google/protobuf/map_lite_unittest.pb.cc
CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.o: CMakeFiles/libtest_common_lite.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.o -MF CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.o.d -o CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.o -c /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/google/protobuf/map_lite_unittest.pb.cc

CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/google/protobuf/map_lite_unittest.pb.cc > CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.i

CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/google/protobuf/map_lite_unittest.pb.cc -o CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.s

CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.o: CMakeFiles/libtest_common_lite.dir/flags.make
CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.o: google/protobuf/unittest_import_lite.pb.cc
CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.o: CMakeFiles/libtest_common_lite.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.o -MF CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.o.d -o CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.o -c /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/google/protobuf/unittest_import_lite.pb.cc

CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/google/protobuf/unittest_import_lite.pb.cc > CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.i

CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/google/protobuf/unittest_import_lite.pb.cc -o CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.s

CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.o: CMakeFiles/libtest_common_lite.dir/flags.make
CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.o: google/protobuf/unittest_import_public_lite.pb.cc
CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.o: CMakeFiles/libtest_common_lite.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.o -MF CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.o.d -o CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.o -c /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/google/protobuf/unittest_import_public_lite.pb.cc

CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/google/protobuf/unittest_import_public_lite.pb.cc > CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.i

CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/google/protobuf/unittest_import_public_lite.pb.cc -o CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.s

CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.o: CMakeFiles/libtest_common_lite.dir/flags.make
CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.o: google/protobuf/unittest_lite.pb.cc
CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.o: CMakeFiles/libtest_common_lite.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.o -MF CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.o.d -o CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.o -c /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/google/protobuf/unittest_lite.pb.cc

CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/google/protobuf/unittest_lite.pb.cc > CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.i

CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/google/protobuf/unittest_lite.pb.cc -o CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.s

# Object files for target libtest_common_lite
libtest_common_lite_OBJECTS = \
"CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.o" \
"CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.o" \
"CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.o" \
"CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.o"

# External object files for target libtest_common_lite
libtest_common_lite_EXTERNAL_OBJECTS =

liblibtest_common_lite.a: CMakeFiles/libtest_common_lite.dir/google/protobuf/map_lite_unittest.pb.cc.o
liblibtest_common_lite.a: CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_lite.pb.cc.o
liblibtest_common_lite.a: CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_import_public_lite.pb.cc.o
liblibtest_common_lite.a: CMakeFiles/libtest_common_lite.dir/google/protobuf/unittest_lite.pb.cc.o
liblibtest_common_lite.a: CMakeFiles/libtest_common_lite.dir/build.make
liblibtest_common_lite.a: CMakeFiles/libtest_common_lite.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX static library liblibtest_common_lite.a"
	$(CMAKE_COMMAND) -P CMakeFiles/libtest_common_lite.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libtest_common_lite.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/libtest_common_lite.dir/build: liblibtest_common_lite.a
.PHONY : CMakeFiles/libtest_common_lite.dir/build

CMakeFiles/libtest_common_lite.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/libtest_common_lite.dir/cmake_clean.cmake
.PHONY : CMakeFiles/libtest_common_lite.dir/clean

CMakeFiles/libtest_common_lite.dir/depend: google/protobuf/map_lite_unittest.pb.cc
CMakeFiles/libtest_common_lite.dir/depend: google/protobuf/map_lite_unittest.pb.h
CMakeFiles/libtest_common_lite.dir/depend: google/protobuf/unittest_import_lite.pb.cc
CMakeFiles/libtest_common_lite.dir/depend: google/protobuf/unittest_import_lite.pb.h
CMakeFiles/libtest_common_lite.dir/depend: google/protobuf/unittest_import_public_lite.pb.cc
CMakeFiles/libtest_common_lite.dir/depend: google/protobuf/unittest_import_public_lite.pb.h
CMakeFiles/libtest_common_lite.dir/depend: google/protobuf/unittest_lite.pb.cc
CMakeFiles/libtest_common_lite.dir/depend: google/protobuf/unittest_lite.pb.h
	cd /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/CMakeFiles/libtest_common_lite.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/libtest_common_lite.dir/depend

