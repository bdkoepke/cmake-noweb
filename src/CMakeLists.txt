cmake_minimum_required(VERSION 2.8)
include(noweb.cmake)
include(UseLatex)
set(quant_C
    main.c)
set(quant_H
    main.h)
set(quant_TEX
    main.tex)

tangle("${quant_H}")
tangle("${quant_C}")
weave("${quant_TEX}")
add_custom_target(tangle DEPENDS ${quant_H} ${quant_C})
add_custom_target(weave DEPENDS ${quant_TEX})

add_executable(quant ${quant_C})
add_dependencies(quant tangle)
target_link_libraries(quant m)

add_latex_document(cmake_noweb.tex
                   FORCE_PDF
                   TARGET_NAME cmake_noweb)
add_dependencies(cmake_noweb_pdf weave)
