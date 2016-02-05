function(tangle files)
    list(LENGTH files files_length)
    math(EXPR length "${files_length} - 1")
    foreach(i RANGE ${length})
        list(GET files ${i} path)
        get_filename_component(name "${path}" NAME)
        get_filename_component(name_we "${path}" NAME_WE)
        get_filename_component(directory "${path}" DIRECTORY)
        string(REPLACE "_" "-" dash_name ${name})
        set(NW_name "${name_we}.nw")
        if(directory)
            set(NW_path "${directory}/${NW_name}")
        else(directory)
            set(NW_path "${NW_name}")
        endif(directory)
        add_custom_command(
            OUTPUT ${path}
            PRE_BUILD
            COMMAND notangle -R${dash_name} ${NW_path} > ${path}
        )
    endforeach(i)
endfunction(tangle)
function(weave files)
    list(LENGTH files files_length)
    math(EXPR length "${files_length} - 1")
    foreach(i RANGE ${length})
        list(GET files ${i} path)
        get_filename_component(name "${path}" NAME)
        get_filename_component(name_we "${path}" NAME_WE)
        get_filename_component(directory "${path}" DIRECTORY)
        set(NW_name "${name_we}.nw")
        if(directory)
            set(NW_path "${directory}/${NW_name}")
        else(directory)
            set(NW_path "${NW_name}")
        endif(directory)
        add_custom_command(
            OUTPUT ${path}
            PRE_BUILD
            COMMAND noweave -x -latex -delay -autodefs c -n ${NW_path} > ${path}
        )
    endforeach(i)
endfunction(weave)
