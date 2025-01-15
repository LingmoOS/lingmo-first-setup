cmake_minimum_required(VERSION 3.5)

set(PROJECT_NAME lingmo-first-setup)
project(${PROJECT_NAME})

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(CMAKE_CXX_FLAGS "-fcoroutines ${CMAKE_CXX_FLAGS}")
endif()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake;${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(QT COMPONENTS Core Gui Quick QuickControls2 Widgets DBus Concurrent X11Extras)
find_package(Qt5 REQUIRED ${QT})
find_package(X11 REQUIRED)
find_package(Freetype REQUIRED)
find_package(PkgConfig REQUIRED)

pkg_search_module(FontConfig REQUIRED fontconfig IMPORTED_TARGET)
pkg_search_module(ICU REQUIRED icu-i18n)

# Get the installation directory from qmake
get_target_property(QT_QMAKE_EXECUTABLE ${Qt5Core_QMAKE_EXECUTABLE} IMPORTED_LOCATION)
if(NOT QT_QMAKE_EXECUTABLE)
    message(FATAL_ERROR "qmake is not found.")
endif()

execute_process(COMMAND ${QT_QMAKE_EXECUTABLE} -query QT_INSTALL_QML
    OUTPUT_VARIABLE INSTALL_QMLDIR
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
if(INSTALL_QMLDIR)
    message(STATUS "qml directory:" "${INSTALL_QMLDIR}")
else()
    message(FATAL_ERROR "qml directory cannot be detected.")
endif()

set(SRCS
    src/main.cpp
    src/version.cpp
    src/appearance.cpp
    src/background.cpp
)

set(RESOURCES
    src/resources.qrc
)

# add_executable(lingmo-first-setup
#   ${PROJECT_SOURCES}
# )

add_executable(${PROJECT_NAME} ${SRCS} ${RESOURCES})
target_link_libraries(${PROJECT_NAME}
        PRIVATE
        Qt5::Core
        Qt5::Quick
        Qt5::QuickControls2
        Qt5::Widgets
        Qt5::DBus
        Qt5::Concurrent
        Qt5::X11Extras
        PkgConfig::FontConfig
        ${FREETYPE_LIBRARIES}
        ${ICU_LDFLAGS}
)

file(GLOB TS_FILES translations/*.ts)
foreach(filepath ${TS_FILES})
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" filename ${filepath})
    list(APPEND ts_files_replaced ${filename})
endforeach()
# qt5_create_translation(QM_FILES ${CMAKE_CURRENT_SOURCE_DIR} ${ts_files_replaced})
add_custom_target(translations ALL DEPENDS ${QM_FILES} SOURCES ${TS_FILES})

install(FILES ${QM_FILES} DESTINATION /usr/share/lingmo-first-setup/translations)

install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION /usr/bin)

install(FILES
    COMPONENT Runtime
)
