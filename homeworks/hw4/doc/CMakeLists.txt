cmake_minimum_required(VERSION 2.8)
include (../../../include/UseLATEX.cmake)

add_custom_target (hw4_copy_files)
add_custom_command (
  TARGET hw4_copy_files
  COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_SOURCE_DIR}/include/macros.sty ./macros.sty
)

add_latex_document (
  hw4.tex MANGLE_TARGET_NAMES
  DEPENDS hw4_copy_files
  CONFIGURE hw4.tex
  DEFAULT_PDF
)
