cmake_minimum_required(VERSION 2.8)
include (${PROJECT_SOURCE_DIR}/include/macros.cmake)

add_custom_target (final_copy_files)
add_custom_command (
  TARGET final_copy_files
  COMMAND ${CMAKE_COMMAND} -E copy ${exam_resources_dir}/exam-1-content.tex ${CMAKE_CURRENT_BINARY_DIR}
  COMMAND ${CMAKE_COMMAND} -E copy ${exam_resources_dir}/exam-2-content.tex ${CMAKE_CURRENT_BINARY_DIR}
  COMMAND ${CMAKE_COMMAND} -E copy ${exam_resources_dir}/final-content.tex ${CMAKE_CURRENT_BINARY_DIR}
)

add_latex_document (
  final-cheat-sheet.tex MANGLE_TARGET_NAMES
  DEPENDS cheat-sheet-macros.sty final_copy_files
  DEFAULT_PDF
)
