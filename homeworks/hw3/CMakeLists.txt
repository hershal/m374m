cmake_minimum_required(VERSION 2.8)
include (${PROJECT_SOURCE_DIR}/include/macros.cmake)

add_subdirectory(src src-bin)

generate_revision()

add_latex_document (
  hw3.tex MANGLE_TARGET_NAMES
  DEPENDS hw3_generate_resources homework-macros.sty revision
  DEFAULT_PDF
)
