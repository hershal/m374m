cmake_minimum_required(VERSION 2.8)
set(hw5_inorder_generators
  generate_2_4_1e)

set(hw5_generators
  generate_minilab)

set(hw5_generator_timestamps)
foreach(generator ${hw5_inorder_generators} ${hw5_generators})
  set(hw5_generator_timestamps ${hw5_generator_timestamps} ${generator}.timestamp)
endforeach()

add_custom_target(hw5_generate_resources
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${hw5_generator_timestamps})

foreach(generator ${hw5_generators})
  add_generator(${generator} ${common_dir}/generate.m)
endforeach()

foreach(generator ${hw5_inorder_generators})
  add_generator(${generator} ${common_dir}/generate_inorder.m)
endforeach()
