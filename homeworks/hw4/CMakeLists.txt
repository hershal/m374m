cmake_minimum_required(VERSION 2.8)
include (${PROJECT_SOURCE_DIR}/include/macros.cmake)

add_subdirectory(src src-bin)

add_latex_document (
  hw4.tex MANGLE_TARGET_NAMES
  DEPENDS hw4_generate_resources macros.sty
  DEFAULT_PDF
)
