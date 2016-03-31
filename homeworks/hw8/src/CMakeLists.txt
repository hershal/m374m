cmake_minimum_required(VERSION 2.8)
set(hw8_inorder_generators )

set(hw8_generators )

set(hw8_generator_timestamps)
foreach(generator ${hw8_inorder_generators} ${hw8_generators})
  set(hw8_generator_timestamps ${hw8_generator_timestamps} ${generator}.timestamp)
endforeach()

add_custom_target(hw8_generate_resources
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${hw8_generator_timestamps})

foreach(generator ${hw8_generators})
  add_generator(${generator} ${common_dir}/generate.m)
endforeach()

foreach(generator ${hw8_inorder_generators})
  add_generator(${generator} ${common_dir}/generate_inorder.m)
endforeach()
