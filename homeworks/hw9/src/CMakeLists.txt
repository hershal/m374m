cmake_minimum_required(VERSION 2.9)
set(hw9_inorder_generators )

set(hw9_generators )

set(hw9_generator_timestamps)
foreach(generator ${hw9_inorder_generators} ${hw9_generators})
  set(hw9_generator_timestamps ${hw9_generator_timestamps} ${generator}.timestamp)
endforeach()

add_custom_target(hw9_generate_resources
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${hw9_generator_timestamps})

foreach(generator ${hw9_generators})
  add_generator(${generator} ${common_dir}/generate.m)
endforeach()

foreach(generator ${hw9_inorder_generators})
  add_generator(${generator} ${common_dir}/generate_inorder.m)
endforeach()
