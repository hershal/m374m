include(${PROJECT_SOURCE_DIR}/include/UseLATEX.cmake)
add_custom_command(OUTPUT macros.sty
  DEPENDS ${PROJECT_SOURCE_DIR}/include/macros.sty
  COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_SOURCE_DIR}/include/macros.sty ./macros.sty
)
