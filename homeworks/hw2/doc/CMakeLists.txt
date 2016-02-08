cmake_minimum_required(VERSION 3.0)
include (../../../include/UseLATEX.cmake)

add_custom_target (hw2_copy_files)
add_custom_command (
  TARGET hw2_copy_files
  COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_SOURCE_DIR}/include/macros.sty ./macros.sty
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog2_fig1.tex ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog2_fig2.tex ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog2_fig1-inc.eps ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog2_fig2-inc.eps ./
)

add_latex_document (
  hw2.tex MANGLE_TARGET_NAMES
  DEPENDS hw2_copy_files
  CONFIGURE hw2.tex
  DEFAULT_PDF
)
