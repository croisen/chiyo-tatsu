# CMake generated Testfile for 
# Source directory: /home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf
# Build directory: /home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[lite-test]=] "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/lite-test")
set_tests_properties([=[lite-test]=] PROPERTIES  WORKING_DIRECTORY "/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf" _BACKTRACE_TRIPLES "/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/cmake/tests.cmake;164;add_test;/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/cmake/tests.cmake;0;;/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/CMakeLists.txt;359;include;/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/CMakeLists.txt;0;")
add_test([=[full-test]=] "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/tests")
set_tests_properties([=[full-test]=] PROPERTIES  WORKING_DIRECTORY "/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf" _BACKTRACE_TRIPLES "/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/cmake/tests.cmake;173;add_test;/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/cmake/tests.cmake;0;;/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/CMakeLists.txt;359;include;/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/CMakeLists.txt;0;")
add_test([=[upb-test]=] "/home/Andrew/git/croisen/chiyo-tatsu/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/build/lin/upb-test")
set_tests_properties([=[upb-test]=] PROPERTIES  WORKING_DIRECTORY "/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf" _BACKTRACE_TRIPLES "/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/cmake/tests.cmake;207;add_test;/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/cmake/tests.cmake;0;;/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/CMakeLists.txt;359;include;/home/Andrew/git/croisen/chiyo-tatsu/extern/protobuf/CMakeLists.txt;0;")
subdirs("third_party/abseil-cpp")
subdirs("third_party/utf8_range")
