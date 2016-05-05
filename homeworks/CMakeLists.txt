cmake_minimum_required(VERSION 2.8)
SET(LATEX_COMPILER_FLAGS
  "-interaction=nonstopmode"
  "--enable-write18"
CACHE STRING "Flags passed to latex."
)
add_subdirectory(hw1)
add_subdirectory(hw2)
add_subdirectory(hw3)
add_subdirectory(hw4)
add_subdirectory(hw5)
add_subdirectory(hw6)
add_subdirectory(hw7)
add_subdirectory(hw8)
add_subdirectory(hw9)
add_subdirectory(hw10)
add_subdirectory(hw11)
add_subdirectory(hw12)
