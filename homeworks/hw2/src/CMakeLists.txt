cmake_minimum_required(VERSION 2.8)
set(hw2_inorder_generators )

set(hw2_generators generate_minilab)

set(hw2_generator_timestamps)
foreach(generator ${hw2_inorder_generators} ${hw2_generators})
  set(hw2_generator_timestamps ${hw2_generator_timestamps} ${generator}.timestamp)
endforeach()

add_custom_target(hw2_generate_resources
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${hw2_generator_timestamps})

foreach(generator ${hw2_generators})
  add_generator(${generator} ${common_dir}/generate.m)
endforeach()

foreach(generator ${hw2_inorder_generators})
  add_generator(${generator} ${common_dir}/generate_inorder.m)
endforeach()
