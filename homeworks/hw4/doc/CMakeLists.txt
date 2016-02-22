cmake_minimum_required(VERSION 2.8)
include (${PROJECT_SOURCE_DIR}/include/macros.cmake)

file(GLOB hw4_resources ${CMAKE_CURRENT_SOURCE_DIR}/../resources/*.mat)
add_custom_target (hw4_copy_resources)
foreach(resource ${hw4_resources})
  add_custom_command(TARGET hw4_copy_resources
    DEPENDS ${resource}
    COMMAND ${CMAKE_COMMAND} -E copy  ${resource} ${CMAKE_CURRENT_BINARY_DIR})
endforeach()

add_latex_document (
  hw4.tex MANGLE_TARGET_NAMES
  DEPENDS hw4_copy_resources macros.sty
  CONFIGURE hw4.tex
  DEFAULT_PDF
)
