cmake_minimum_required(VERSION 2.8)
project(notes)
include (../include/UseLATEX.cmake)

add_custom_target (copy)
add_custom_command (
  TARGET copy
  COMMAND ${CMAKE_COMMAND} -E copy ../../include/macros.sty ./macros.sty
)

add_latex_document (
  writeup.tex
  DEPENDS copy
  CONFIGURE writeup.tex
  DEFAULT_PDF
)
