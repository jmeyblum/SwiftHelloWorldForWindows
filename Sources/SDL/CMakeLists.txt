
set(SDL2_VERSION "SDL2-2.0.10")

find_path(SDL2_ROOT "include/SDL.h" PATHS "${CMAKE_CURRENT_LIST_DIR}/../../External/${SDL2_VERSION}" NO_DEFAULT_PATH)

if(NOT SDL2_ROOT)
	message( FATAL_ERROR "SDL2 not found.")
endif()

set(SDL2_INCLUDE_DIRS "${SDL2_ROOT}/include")
set(SDL2_LIBS "${SDL2_ROOT}/lib/x64/SDL2.lib")
set(SDL2_DLLS "${SDL2_ROOT}/lib/x64/SDL2.dll")

add_library(SDL SHARED
	Wrappers/Event.swift
	Wrappers/Keyboard.swift
	Wrappers/Renderer.swift
	Wrappers/SDL.swift
	Wrappers/SDL_Image.swift
	Wrappers/Surface.swift
	Wrappers/Texture.swift
	Wrappers/Timer.swift
	Wrappers/Version.swift
	Wrappers/Window.swift
)
target_compile_options(SDL PRIVATE
  "SHELL:-Xcc -DNONAMELESSUNION"
  "SHELL:-Xcc -DCOBJMACROS")
target_include_directories(SDL PUBLIC ${SDL2_INCLUDE_DIRS})
target_include_directories(SDL PUBLIC Include)
target_link_libraries(SDL PUBLIC ${SDL2_LIBS})
set_target_properties(SDL PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Swift_MODULE_DIRECTORY}
  INTERFACE_LINK_DIRECTORIES $<TARGET_LINKER_FILE_DIR:SDL>)