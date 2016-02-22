cmake_minimum_required(VERSION 2.8)
add_custom_target(hw4_generate_resources)
add_custom_command(TARGET hw4_generate_resources
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
  COMMAND "octave" "-W" "${CMAKE_CURRENT_SOURCE_DIR}/generate_2_1_5.m"
)
