find_package(raylib QUIET)

if (raylib_FOUND)
	target_include_directories(${PROJECT_NAME} PUBLIC ${raylib_INCLUDE_DIR})
	target_link_directories(${PROJECT_NAME} PRIVATE ${raylib_LIBRARY_DIR})
	target_link_libraries(${PROJECT_NAME} PRIVATE raylib winmm opengl32)
endif()