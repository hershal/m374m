cmake_minimum_required(VERSION 2.8)
set(hw6_inorder_generators generate_2_6_4_2b)

set(hw6_generators generate_minilab)

set(hw6_generator_timestamps)
foreach(generator ${hw6_inorder_generators} ${hw6_generators})
  set(hw6_generator_timestamps ${hw6_generator_timestamps} ${generator}.timestamp)
endforeach()

add_custom_target(hw6_generate_resources
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${hw6_generator_timestamps})

foreach(generator ${hw6_generators})
  add_generator(${generator} ${common_dir}/generate.m)
endforeach()

foreach(generator ${hw6_inorder_generators})
  add_generator(${generator} ${common_dir}/generate_inorder.m)
endforeach()
