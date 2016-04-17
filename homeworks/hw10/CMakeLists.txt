cmake_minimum_required(VERSION 2.9)
include (${PROJECT_SOURCE_DIR}/include/macros.cmake)

generate_revision()

add_latex_document (
  hw10.tex MANGLE_TARGET_NAMES
  DEPENDS homework-macros.sty revision
  DEFAULT_PDF
)
