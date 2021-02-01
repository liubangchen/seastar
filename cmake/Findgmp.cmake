
find_package (PkgConfig REQUIRED)

pkg_search_module (gmp_PC libgmp)

find_library (gmp_LIBRARY
  NAMES gmp
  HINTS
    ${gmp_PC_LIBDIR}
    ${gmp_PC_LIBRARY_DIRS})

find_path (gmp_INCLUDE_DIR
  NAMES gmp.h
  HINTS
    ${gmp_PC_INCLUDEDIR}
    ${gmp_PC_INCLUDEDIRS})

mark_as_advanced (
  gmp_LIBRARY
  gmp_INCLUDE_DIR)

include (FindPackageHandleStandardArgs)

find_package_handle_standard_args (gmp
  REQUIRED_VARS
    gmp_LIBRARY
    gmp_INCLUDE_DIR
  VERSION_VAR gmp_PC_VERSION)

set (gmp_LIBRARIES ${gmp_LIBRARY})
set (gmp_INCLUDE_DIRS ${gmp_INCLUDE_DIR})

if (gmp_FOUND)
  set (CMAKE_REQUIRED_LIBRARIES ${gmp_LIBRARY})
  include (CheckSymbolExists)

  check_symbol_exists (GMP_compress_default
    ${gmp_INCLUDE_DIR}/gmp.h
    gmp_HAVE_COMPRESS_DEFAULT)
endif ()

if (gmp_FOUND AND NOT (TARGET gmp::gmp))
  add_library (gmp::gmp UNKNOWN IMPORTED)

  set_target_properties (gmp::gmp
    PROPERTIES
      IMPORTED_LOCATION ${gmp_LIBRARY}
      INTERFACE_INCLUDE_DIRECTORIES ${gmp_INCLUDE_DIRS})
endif ()
