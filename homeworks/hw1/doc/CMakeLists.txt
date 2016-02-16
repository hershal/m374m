cmake_minimum_required(VERSION 2.8)
include (../../../include/UseLATEX.cmake)

add_custom_target (hw1_copy_files)
add_custom_command (
  TARGET hw1_copy_files
  COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_SOURCE_DIR}/include/macros.sty ./macros.sty
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog1_fig1.tex ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog1_fig2.tex ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog1_fig1-inc.eps ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog1_fig2-inc.eps ./
)

add_latex_document (
  hw1.tex MANGLE_TARGET_NAMES
  DEPENDS hw1_copy_files
  CONFIGURE hw1.tex
  DEFAULT_PDF
)
