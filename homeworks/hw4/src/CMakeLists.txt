cmake_minimum_required(VERSION 2.8)
set(hw4_generators
  generate_2_1_5 generate_2_2_1a
  generate_2_2_1f generate_2_2_5 generate_minilab)

set(hw4_generator_timestamps)
foreach(generator ${hw4_generators} ${hw4_minilab_generators})
  set(hw4_generator_timestamps ${hw4_generator_timestamps} ${generator}.timestamp)
endforeach()

add_custom_target(hw4_generate_resources
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${hw4_generator_timestamps}
  ${CMAKE_CURRENT_BINARY_DIR}/generate_2_1_3.timestamp)

foreach(generator ${hw4_generators})
  add_generator(${generator} ${CMAKE_CURRENT_SOURCE_DIR}/generate.m)
endforeach()

add_generator(generate_2_1_3 ${CMAKE_CURRENT_SOURCE_DIR}/generate_inorder.m)
