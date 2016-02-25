cmake_minimum_required(VERSION 2.8)

add_custom_target(hw1_generate_resources
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/generate_minilab.timestamp)

add_generator(generate_minilab)
