add_executable(${PROJECT_NAME}
  HelloWorld.swift)

# FIXME(SR-12683) `@main` requires `-parse-as-library`
target_compile_options(${PROJECT_NAME} PRIVATE
  -parse-as-library)
