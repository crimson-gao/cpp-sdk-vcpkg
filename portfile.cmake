vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO crimson-gao/aliyun-log-cpp-sdk
    REF "v0.0.2-pre.9"
    SHA512 7c124ea7a68108c0c6ce68e4635a4909ed83e077b13d561e839c561c03dca5461ba698443b7131b0188dcdafb0727dfee51c4adcaef206a64c61633e1acc8137
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_EXAMPLE=OFF
)

vcpkg_cmake_install()
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)

vcpkg_cmake_config_fixup(PACKAGE_NAME aliyun_log CONFIG_PATH share/aliyun_log)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/sls" "${CURRENT_PACKAGES_DIR}/lib/sls")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)