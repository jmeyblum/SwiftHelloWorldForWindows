add_subdirectory(SDL)

add_executable(${PROJECT_NAME}
  HelloWorld.swift)

target_link_libraries(${PROJECT_NAME} PRIVATE
  SDL)

# FIXME(SR-12683) `@main` requires `-parse-as-library`
target_compile_options(${PROJECT_NAME} PRIVATE
  -parse-as-library)
