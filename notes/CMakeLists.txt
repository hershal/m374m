cmake_minimum_required(VERSION 2.8)
project(notes)
include (../include/UseLATEX.cmake)

add_custom_target (notes_copy_files)
add_custom_command (
  TARGET notes_copy_files
  COMMAND ${CMAKE_COMMAND} -E copy ../../include/macros.sty ./macros.sty
)

add_latex_document (
  notes.tex MANGLE_TARGET_NAMES
  DEPENDS notes_copy_files
  CONFIGURE notes.tex
  DEFAULT_PDF
)
