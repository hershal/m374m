cmake_minimum_required(VERSION 2.8)
include (${PROJECT_SOURCE_DIR}/include/macros.cmake)

add_subdirectory(src src-bin)

add_latex_document (
  hw6.tex MANGLE_TARGET_NAMES
  DEPENDS hw6_generate_resources homework-macros.sty
  DEFAULT_PDF
)
