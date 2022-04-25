file(
    RELATIVE_PATH relative_path
    "/${fccf_INSTALL_CMAKEDIR}"
    "/${CMAKE_INSTALL_BINDIR}/${fccf_NAME}"
)

get_filename_component(prefix "${CMAKE_INSTALL_PREFIX}" ABSOLUTE)
set(config_dir "${prefix}/${fccf_INSTALL_CMAKEDIR}")
set(config_file "${config_dir}/fccfConfig.cmake")

message(STATUS "Installing: ${config_file}")
file(WRITE "${config_file}" "\
get_filename_component(
    _fccf_executable
    \"\${CMAKE_CURRENT_LIST_DIR}/${relative_path}\"
    ABSOLUTE
)
set(
    FCCF_EXECUTABLE \"\${_fccf_executable}\"
    CACHE FILEPATH \"Path to the fccf executable\"
)
")
list(APPEND CMAKE_INSTALL_MANIFEST_FILES "${config_file}")
