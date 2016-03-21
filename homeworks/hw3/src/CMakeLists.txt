cmake_minimum_required(VERSION 2.8)
set(hw3_inorder_generators )

set(hw3_generators generate_minilab)

set(hw3_generator_timestamps)
foreach(generator ${hw3_inorder_generators} ${hw3_generators})
  set(hw3_generator_timestamps ${hw3_generator_timestamps} ${generator}.timestamp)
endforeach()

add_custom_target(hw3_generate_resources
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${hw3_generator_timestamps})

foreach(generator ${hw3_generators})
  add_generator(${generator} ${common_dir}/generate.m)
endforeach()

foreach(generator ${hw3_inorder_generators})
  add_generator(${generator} ${common_dir}/generate_inorder.m)
endforeach()
