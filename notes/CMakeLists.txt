cmake_minimum_required(VERSION 2.8)
include (${PROJECT_SOURCE_DIR}/include/macros.cmake)

add_latex_document (
  notes.tex MANGLE_TARGET_NAMES
  DEPENDS homework-macros.sty
  DEFAULT_PDF
)
