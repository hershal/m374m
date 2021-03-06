include(${PROJECT_SOURCE_DIR}/include/UseLATEX.cmake)

add_custom_command(OUTPUT homework-macros.sty
  DEPENDS ${PROJECT_SOURCE_DIR}/include/macros.sty ${PROJECT_SOURCE_DIR}/include/homework-macros.sty
  COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_SOURCE_DIR}/include/macros.sty ./macros.sty
  COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_SOURCE_DIR}/include/homework-macros.sty ./homework-macros.sty
)

add_custom_command(OUTPUT notes-macros.sty
  DEPENDS ${PROJECT_SOURCE_DIR}/include/macros.sty ${PROJECT_SOURCE_DIR}/include/notes-macros.sty
  COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_SOURCE_DIR}/include/macros.sty ./macros.sty
  COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_SOURCE_DIR}/include/notes-macros.sty ./notes-macros.sty
)

add_custom_command(OUTPUT cheat-sheet-macros.sty
  DEPENDS ${PROJECT_SOURCE_DIR}/include/macros.sty ${PROJECT_SOURCE_DIR}/include/cheat-sheet-macros.sty
  COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_SOURCE_DIR}/include/macros.sty ./macros.sty
  COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_SOURCE_DIR}/include/cheat-sheet-macros.sty ./cheat-sheet-macros.sty
)

function (add_generator generator)
  add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${generator}.timestamp
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${generator}.m ${ARGN}
    COMMAND "octave" "-q" "-p" "${CMAKE_CURRENT_SOURCE_DIR}" "-p" "${common_dir}" "${CMAKE_CURRENT_SOURCE_DIR}/${generator}.m"
    COMMAND ${CMAKE_COMMAND} -E touch ${CMAKE_CURRENT_BINARY_DIR}/${generator}.timestamp
    )
endfunction()

function (generate_revision)
  add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/revision
    COMMAND "git" "log" "--pretty=format:'%h'" "-n" "1" "--" ${CMAKE_CURRENT_SOURCE_DIR} ">" "${CMAKE_CURRENT_BINARY_DIR}/revision"
    )
endfunction()
