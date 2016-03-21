cmake_minimum_required(VERSION 2.8)
set(hw7_inorder_generators )

set(hw7_generators )

set(hw7_generator_timestamps)
foreach(generator ${hw7_inorder_generators} ${hw7_generators})
  set(hw7_generator_timestamps ${hw7_generator_timestamps} ${generator}.timestamp)
endforeach()

add_custom_target(hw7_generate_resources
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${hw7_generator_timestamps})

foreach(generator ${hw7_generators})
  add_generator(${generator} ${common_dir}/generate.m)
endforeach()

foreach(generator ${hw7_inorder_generators})
  add_generator(${generator} ${common_dir}/generate_inorder.m)
endforeach()
