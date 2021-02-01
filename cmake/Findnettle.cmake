
find_package (PkgConfig REQUIRED)

pkg_search_module (nettle_PC nettle)

find_library (nettle_LIBRARY
  NAMES nettle
  HINTS
    ${nettle_PC_LIBDIR}
    ${nettle_PC_LIBRARY_DIRS})

find_path (nettle_INCLUDE_DIR
  NAMES nettle.h
  HINTS
    ${nettle_PC_INCLUDEDIR}
    ${nettle_PC_INCLUDEDIRS})

message("Find nettle include ${nettle_PC_INCLUDEDIR}")
message("Find nettle library ${nettle_PC_LIBDIR}")

mark_as_advanced (
  nettle_LIBRARY
  nettle_INCLUDE_DIR)

include (FindPackageHandleStandardArgs)

find_package_handle_standard_args (nettle
  REQUIRED_VARS
    nettle_LIBRARY
    nettle_INCLUDE_DIR
  VERSION_VAR nettle_PC_VERSION)

set (nettle_LIBRARIES ${nettle_LIBRARY})
set (nettle_INCLUDE_DIRS ${nettle_INCLUDE_DIR})

if (nettle_FOUND)
  set (CMAKE_REQUIRED_LIBRARIES ${nettle_LIBRARY})
  include (CheckSymbolExists)

  check_symbol_exists (NETTLE_compress_default
    ${nettle_INCLUDE_DIR}/nettle.h
    nettle_HAVE_COMPRESS_DEFAULT)
endif ()

if (nettle_FOUND AND NOT (TARGET nettle::nettle))
  add_library (nettle::nettle UNKNOWN IMPORTED)
  #它相当于g++选项中的-I参数的作用，也相当于环境变量中增加路径到CPLUS_INCLUDE_PATH变量的作用。
  #include_directories(../../../thirdparty/comm/include)
  #它相当于g++命令的-L选项的作用，也相当于环境变量中增加LD_LIBRARY_PATH的路径的作用。
  link_directories(${nettle_PC_LIBDIR})
  #添加需要链接的库文件路径LINK_LIBRARIES 也可以链接多个 空格分隔
  link_libraries(${nettle_LIBRARY})
  set_target_properties (nettle::nettle
    PROPERTIES
      IMPORTED_LOCATION ${nettle_LIBRARY}
      INTERFACE_INCLUDE_DIRECTORIES ${nettle_INCLUDE_DIRS})
endif ()
