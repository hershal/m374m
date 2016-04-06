cmake_minimum_required(VERSION 2.8)
include (${PROJECT_SOURCE_DIR}/include/macros.cmake)

add_custom_target (exam_1_copy_files)
add_custom_command (
  OUTPUT exam-1-content.tex
  DEPENDS ${exam_resources_dir}/exam-1-content.tex
  COMMAND ${CMAKE_COMMAND} -E copy ${exam_resources_dir}/exam-1-content.tex ${CMAKE_CURRENT_BINARY_DIR}
)

add_latex_document (
  exam-1-cheat-sheet.tex MANGLE_TARGET_NAMES
  DEPENDS cheat-sheet-macros.sty exam-1-content.tex
  DEFAULT_PDF
)
