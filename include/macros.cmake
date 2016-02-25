include(${PROJECT_SOURCE_DIR}/include/UseLATEX.cmake)
add_custom_command(OUTPUT macros.sty
  DEPENDS ${PROJECT_SOURCE_DIR}/include/macros.sty
  COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_SOURCE_DIR}/include/macros.sty ./macros.sty
)

function (add_generator generator)
  add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${generator}.timestamp
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${generator}.m ${CMAKE_CURRENT_SOURCE_DIR}/generate.m
    COMMAND "octave" "-p" "${CMAKE_CURRENT_SOURCE_DIR}" ${CMAKE_CURRENT_SOURCE_DIR}/${generator}.m
    COMMAND ${CMAKE_COMMAND} -E touch ${CMAKE_CURRENT_BINARY_DIR}/${generator}.timestamp
    )
endfunction()
