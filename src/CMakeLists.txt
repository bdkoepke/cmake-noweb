cmake_minimum_required(VERSION 2.8)
include(noweb.cmake)
include(UseLatex)
set(cmake_noweb_C
    main.c)
set(cmake_noweb_H
    main.h)
set(cmake_noweb_TEX
    main.tex)

tangle("${cmake_noweb_H}")
tangle("${cmake_noweb_C}")
weave("${cmake_noweb_TEX}")
add_custom_target(tangle DEPENDS ${cmake_noweb_H} ${cmake_noweb_C})
add_custom_target(weave DEPENDS ${cmake_noweb_TEX})

add_executable(cmake_noweb ${cmake_noweb_C})
add_dependencies(cmake_noweb tangle)
target_link_libraries(cmake_noweb m)

add_latex_document(cmake_noweb.tex
                   FORCE_PDF
                   TARGET_NAME _cmake_noweb)
add_dependencies(_cmake_noweb_pdf weave)
