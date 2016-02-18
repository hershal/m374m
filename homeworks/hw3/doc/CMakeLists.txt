cmake_minimum_required(VERSION 2.8)
include (${PROJECT_SOURCE_DIR}/include/macros.cmake)

add_custom_target (hw3_copy_files)
add_custom_command (
  TARGET hw3_copy_files
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog3_fig1.tex ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog3_fig2.tex ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog3_fig3.tex ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog3_fig4.tex ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog3_fig5.tex ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog3_fig1-inc.eps ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog3_fig2-inc.eps ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog3_fig3-inc.eps ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog3_fig4-inc.eps ./
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../resources/prog3_fig5-inc.eps ./
)

add_latex_document (
  hw3.tex MANGLE_TARGET_NAMES
  DEPENDS hw3_copy_files macros.sty
  CONFIGURE hw3.tex
  DEFAULT_PDF
)
