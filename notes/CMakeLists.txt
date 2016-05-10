cmake_minimum_required(VERSION 2.8)
include (${PROJECT_SOURCE_DIR}/include/macros.cmake)

generate_revision()

add_latex_document (
  notes.tex MANGLE_TARGET_NAMES
  DEPENDS notes-macros.sty revision
  DEFAULT_PDF
)
