cmake_minimum_required(VERSION 2.8)
include (${PROJECT_SOURCE_DIR}/include/macros.cmake)

file(GLOB hw3_resources ${CMAKE_CURRENT_SOURCE_DIR}/../resources/*.tex
  ${CMAKE_CURRENT_SOURCE_DIR}/../resources/*.eps)
add_custom_target (hw3_copy_resources)
foreach(resource ${hw3_resources})
  add_custom_command(TARGET hw3_copy_resources
    DEPENDS ${resource}
    COMMAND ${CMAKE_COMMAND} -E copy  ${resource} ./)
endforeach()

add_latex_document (
  hw3.tex MANGLE_TARGET_NAMES
  DEPENDS hw3_copy_resources macros.sty
  CONFIGURE hw3.tex
  DEFAULT_PDF
)
