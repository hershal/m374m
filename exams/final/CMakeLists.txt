cmake_minimum_required(VERSION 2.8)
include (${PROJECT_SOURCE_DIR}/include/macros.cmake)

add_custom_target (final_copy_files)
add_custom_command (
  OUTPUT final-content.tex
  DEPENDS ${exam_resources_dir}/final-content.tex
  COMMAND ${CMAKE_COMMAND} -E copy ${exam_resources_dir}/final-content.tex ${CMAKE_CURRENT_BINARY_DIR}
)
add_custom_command (
  OUTPUT perturbation-methods.tex
  DEPENDS ${exam_resources_dir}/perturbation-methods.tex
  COMMAND ${CMAKE_COMMAND} -E copy ${exam_resources_dir}/perturbation-methods.tex ${CMAKE_CURRENT_BINARY_DIR}
)

add_latex_document (
  final-cheat-sheet.tex MANGLE_TARGET_NAMES
  DEPENDS cheat-sheet-macros.sty perturbation-methods.tex final-content.tex
  DEFAULT_PDF
)
