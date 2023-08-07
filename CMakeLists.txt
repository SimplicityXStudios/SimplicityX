cmake_minimum_required(VERSION 3.26)
project(SimplicityX C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Find raylib
find_package(raylib QUIET)

# If raylib is not found, fetch it from GitHub
if (NOT raylib_FOUND)
    message(FATAL_ERROR "Raylib not found!")
endif()


# Define the shared library
add_library(${PROJECT_NAME} SHARED src/library.c src/library.h
        include/raylib.h)

# Link raylib
target_link_libraries(${PROJECT_NAME} raylib winmm opengl32)

# Add raylib include directory
target_include_directories(${PROJECT_NAME} PRIVATE include)

set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER src/library.h)

install(TARGETS SimplicityX
        LIBRARY DESTINATION lib
        PUBLIC_HEADER DESTINATION include/SimplicityX
    )

install(DIRECTORY ${CMAKE_SOURCE_DIR}/include/ 
        DESTINATION include
    )

install(FILES SimplicityXConfig.cmake
        DESTINATION lib/cmake/SimplicityX
)