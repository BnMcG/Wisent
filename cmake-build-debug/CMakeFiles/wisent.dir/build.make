# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/norbit/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/163.13906.4/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/norbit/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/163.13906.4/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/norbit/wisent

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/norbit/wisent/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/wisent.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/wisent.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/wisent.dir/flags.make

CMakeFiles/wisent.dir/ast.cpp.o: CMakeFiles/wisent.dir/flags.make
CMakeFiles/wisent.dir/ast.cpp.o: ../ast.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/norbit/wisent/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/wisent.dir/ast.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/wisent.dir/ast.cpp.o -c /home/norbit/wisent/ast.cpp

CMakeFiles/wisent.dir/ast.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wisent.dir/ast.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/norbit/wisent/ast.cpp > CMakeFiles/wisent.dir/ast.cpp.i

CMakeFiles/wisent.dir/ast.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wisent.dir/ast.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/norbit/wisent/ast.cpp -o CMakeFiles/wisent.dir/ast.cpp.s

CMakeFiles/wisent.dir/ast.cpp.o.requires:

.PHONY : CMakeFiles/wisent.dir/ast.cpp.o.requires

CMakeFiles/wisent.dir/ast.cpp.o.provides: CMakeFiles/wisent.dir/ast.cpp.o.requires
	$(MAKE) -f CMakeFiles/wisent.dir/build.make CMakeFiles/wisent.dir/ast.cpp.o.provides.build
.PHONY : CMakeFiles/wisent.dir/ast.cpp.o.provides

CMakeFiles/wisent.dir/ast.cpp.o.provides.build: CMakeFiles/wisent.dir/ast.cpp.o


CMakeFiles/wisent.dir/wisent.tab.cpp.o: CMakeFiles/wisent.dir/flags.make
CMakeFiles/wisent.dir/wisent.tab.cpp.o: ../wisent.tab.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/norbit/wisent/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/wisent.dir/wisent.tab.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/wisent.dir/wisent.tab.cpp.o -c /home/norbit/wisent/wisent.tab.cpp

CMakeFiles/wisent.dir/wisent.tab.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wisent.dir/wisent.tab.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/norbit/wisent/wisent.tab.cpp > CMakeFiles/wisent.dir/wisent.tab.cpp.i

CMakeFiles/wisent.dir/wisent.tab.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wisent.dir/wisent.tab.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/norbit/wisent/wisent.tab.cpp -o CMakeFiles/wisent.dir/wisent.tab.cpp.s

CMakeFiles/wisent.dir/wisent.tab.cpp.o.requires:

.PHONY : CMakeFiles/wisent.dir/wisent.tab.cpp.o.requires

CMakeFiles/wisent.dir/wisent.tab.cpp.o.provides: CMakeFiles/wisent.dir/wisent.tab.cpp.o.requires
	$(MAKE) -f CMakeFiles/wisent.dir/build.make CMakeFiles/wisent.dir/wisent.tab.cpp.o.provides.build
.PHONY : CMakeFiles/wisent.dir/wisent.tab.cpp.o.provides

CMakeFiles/wisent.dir/wisent.tab.cpp.o.provides.build: CMakeFiles/wisent.dir/wisent.tab.cpp.o


CMakeFiles/wisent.dir/wisent.yy.cpp.o: CMakeFiles/wisent.dir/flags.make
CMakeFiles/wisent.dir/wisent.yy.cpp.o: ../wisent.yy.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/norbit/wisent/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/wisent.dir/wisent.yy.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/wisent.dir/wisent.yy.cpp.o -c /home/norbit/wisent/wisent.yy.cpp

CMakeFiles/wisent.dir/wisent.yy.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wisent.dir/wisent.yy.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/norbit/wisent/wisent.yy.cpp > CMakeFiles/wisent.dir/wisent.yy.cpp.i

CMakeFiles/wisent.dir/wisent.yy.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wisent.dir/wisent.yy.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/norbit/wisent/wisent.yy.cpp -o CMakeFiles/wisent.dir/wisent.yy.cpp.s

CMakeFiles/wisent.dir/wisent.yy.cpp.o.requires:

.PHONY : CMakeFiles/wisent.dir/wisent.yy.cpp.o.requires

CMakeFiles/wisent.dir/wisent.yy.cpp.o.provides: CMakeFiles/wisent.dir/wisent.yy.cpp.o.requires
	$(MAKE) -f CMakeFiles/wisent.dir/build.make CMakeFiles/wisent.dir/wisent.yy.cpp.o.provides.build
.PHONY : CMakeFiles/wisent.dir/wisent.yy.cpp.o.provides

CMakeFiles/wisent.dir/wisent.yy.cpp.o.provides.build: CMakeFiles/wisent.dir/wisent.yy.cpp.o


# Object files for target wisent
wisent_OBJECTS = \
"CMakeFiles/wisent.dir/ast.cpp.o" \
"CMakeFiles/wisent.dir/wisent.tab.cpp.o" \
"CMakeFiles/wisent.dir/wisent.yy.cpp.o"

# External object files for target wisent
wisent_EXTERNAL_OBJECTS =

wisent: CMakeFiles/wisent.dir/ast.cpp.o
wisent: CMakeFiles/wisent.dir/wisent.tab.cpp.o
wisent: CMakeFiles/wisent.dir/wisent.yy.cpp.o
wisent: CMakeFiles/wisent.dir/build.make
wisent: CMakeFiles/wisent.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/norbit/wisent/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable wisent"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wisent.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/wisent.dir/build: wisent

.PHONY : CMakeFiles/wisent.dir/build

CMakeFiles/wisent.dir/requires: CMakeFiles/wisent.dir/ast.cpp.o.requires
CMakeFiles/wisent.dir/requires: CMakeFiles/wisent.dir/wisent.tab.cpp.o.requires
CMakeFiles/wisent.dir/requires: CMakeFiles/wisent.dir/wisent.yy.cpp.o.requires

.PHONY : CMakeFiles/wisent.dir/requires

CMakeFiles/wisent.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/wisent.dir/cmake_clean.cmake
.PHONY : CMakeFiles/wisent.dir/clean

CMakeFiles/wisent.dir/depend:
	cd /home/norbit/wisent/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/norbit/wisent /home/norbit/wisent /home/norbit/wisent/cmake-build-debug /home/norbit/wisent/cmake-build-debug /home/norbit/wisent/cmake-build-debug/CMakeFiles/wisent.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/wisent.dir/depend

