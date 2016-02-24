cmake_minimum_required(VERSION 2.8)
set(hw4_generators
  generate_2_1_5 generate_2_1_5 generate_2_2_1a
  generate_2_2_1f generate_2_2_5 generate_minilab)

set(hw4_generator_timestamps)
foreach(generator ${hw4_generators} ${hw4_minilab_generators})
  set(hw4_generator_timestamps ${hw4_generator_timestamps} ${generator}.timestamp)
endforeach()

add_custom_target(hw4_generate_resources
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${hw4_generator_timestamps})
set_target_properties(hw4_generate_resources PROPERTIES OUTPUT_LOCATION ${CMAKE_CURRENT_BINARY_DIR})

foreach(generator ${hw4_generators})
  add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${generator}.timestamp
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${generator}.m ${CMAKE_CURRENT_SOURCE_DIR}/generate.m
    COMMAND "octave" "-p" "${CMAKE_CURRENT_SOURCE_DIR}" ${CMAKE_CURRENT_SOURCE_DIR}/${generator}.m
    COMMAND ${CMAKE_COMMAND} -E touch ${CMAKE_CURRENT_BINARY_DIR}/${generator}.timestamp
    )
endforeach()
