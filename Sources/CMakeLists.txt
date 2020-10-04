add_executable(SwiftSampleProject
  SwiftSampleProject.swift)

# FIXME(SR-12683) `@main` requires `-parse-as-library`
target_compile_options(SwiftSampleProject PRIVATE
  -parse-as-library)
