#!/bin/sh

# 添加依赖
# git submodule add --name contrib/boost  https://github.com/ClickHouse-Extras/boost.git contrib/boost

#  -DBOOST_INCLUDE_PATH=/media/psf/Home/workspace/github/seastar/contrib/boost/ \
#  -DBOOST_LIBRARYDIR=/media/psf/Home/workspace/github/seastar/contrib/boost/boost \
#  -Dc-ares_PC_ROOT=/Media/psf/Home/workspace/github/seastar/contrib/cares \
#  -Dc-ares_LIBRARY_DIR=/media/psf/Home/workspace/github/seastar/contrib/contrib/cares \
#  -Dc-ares_INCLUDE_DIR=/media/psf/Home/workspace/github/seastar/contrib/contrib/cares/include \
export LIB_DIR=/media/psf/Home/workspace/github/seastar

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$LIB_DIR/contrib/nettle/lib64/pkgconfig:$LIB_DIR/contrib/gmp/lib/pkgconfig:$LIB_DIR/contrib/c-ares/lib/pkgconfig:$LIB_DIR/contrib/lz4/lib/pkgconfig:/usr/local/gnutls/lib/pkgconfig:$LIB_DIR/contrib/hwloc/lib/pkgconfig/:$LIB_DIR/contrib/yaml-cpp/lib/pkgconfig:$LIB_DIR/contrib/numactl/lib/pkgconfig

export GMPDIR=${LIB_DIR}/gmp
#echo "PKG_CONFIG_PATH: $PKG_CONFIG_PATH  "
rm -rf CMakeCache.txt
rm -rf CMakeFiles
rm -rf apps demos doc gen pkgconfig Makefile Testing tests
rm -rf *.cmake *.pc *.tcl
rm -rf *.a *.pc
#-DCMAKE_C_COMPILER=gcc \
#-DCMAKE_CXX_COMPILER=g++ \
#-DGnuTLS_PC_LIBDIR=/usr/local/gnutls/lib \
#-DGnuTLS_PC_INCLUDEDIR=/usr/local/gnutls/include \
#-Dnettle_INCLUDE_DIR=${LIB_DIR}/contrib/nettle/include \
#-Dnettle_LIBRARY=${LIB_DIR}/contrib/nettle/lib64/libnettle.a \
#-Dgmp_INCLUDE_DIR=${LIB_DIR}/contrib/gmp/include \
#-Dgmp_LIBRARY=${LIB_DIR}/contrib/gmp/lib/libgmp.a \


#  -Ddpdk_LIBRARIES=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PMD_VMXNET3_UIO_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PMD_I40E_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PMD_IXGBE_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PMD_E1000_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PMD_BNXT_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PMD_RING_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PMD_CXGBE_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PMD_ENA_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PMD_ENIC_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PMD_NFP_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PMD_QEDE_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_RING_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_KVARGS_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_MEMPOOL_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_MEMPOOL_RING_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_HASH_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_CMDLINE_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_MBUF_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_CFGFILE_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_EAL_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_ETHDEV_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_NET_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_TIMER_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PCI_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_BUS_PCI_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_BUS_VDEV_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PMD_FM10K_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \
#  -Ddpdk_PMD_SFC_EFX_LIBRARY=${LIB_DIR}/contrib/dpdk/lib \


cmake  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DSeastar_EXCLUDE_APPS_FROM_ALL=yes \
  -DSeastar_EXCLUDE_DEMOS_FROM_ALL=yes \
  -DCMAKE_SOURCE_DIR=${LIB_DIR} \
  -DSeastar_APPS=yes \
  -Ddpdk_INCLUDE_DIR=${LIB_DIR}/contrib/dpdk/include/dpdk \
  -DSeastar_TESTING=no \
  -Dfmt_INCLUDE_DIR=${LIB_DIR}/contrib/fmt/include  \
  -Dfmt_LIBRARY=${LIB_DIR}/contrib/fmt/lib64/libfmt.a  \
  -Dnumactl_INCLUDE_DIR=${LIB_DIR}/contrib/numactl/include \
  -Dnumactl_LIBRARY=${LIB_DIR}/contrib/numactl/lib/libnuma.a  \
  -Dragel_RAGEL_EXECUTABLE=$LIB_DIR/contrib/ragel/bin/ragel \
  -DCMAKE_INSTALL_PREFIX=/usr/local/seastar \
  -DSeastar_EXCLUDE_TESTS_FROM_ALL=no \
  -DSeastar_EXCLUDE_APPS_FROM_ALL=no \
  -DSeastar_EXCLUDE_DEMOS_FROM_ALL=no \
  -DSeastar_CXX_DIALECT="gnu++17" \
  -DSeastar_SPLIT_DWARF=no \
  -DSeastar_HEAP_PROFILING=no \
  -DSeastar_UNUSED_RESULT_ERROR=no \
  -Dc-ares_LIBRARY=${LIB_DIR}/contrib/c-ares/lib/libcares.a \
  -Dc-ares_INCLUDE_DIR=${LIB_DIR}/contrib/c-ares/include \
  -Dcryptopp_LIBRARY=${LIB_DIR}/contrib/cryptopp/lib/libcryptopp.a  \
  -Dcryptopp_INCLUDE_DIR=${LIB_DIR}/contrib/cryptopp/include  \
  -DSeastar_HWLOC=no \
  -DSeastar_ALLOC_FAILURE_INJECTION=no \
  -DSeastar_ALLOC_PAGE_SIZE=no \
  -Dhwloc_LIBRARY=${LIB_DIR}/contrib/hwloc/lib/libhwloc.a \
  -Dhwloc_INCLUDE_DIR=${LIB_DIR}/contrib/hwloc/include \
  -DSeastar_DPDK=yes \
  -DSeastar_DPDK_MACHINE=native \
  -DBOOST_ROOT=${LIB_DIR}/contrib/boost \
  -DProtobuf_INCLUDE_DIR=${LIB_DIR}/contrib/protobuf/include \
  -DProtobuf_SRC_ROOT_FOLDER=/media/psf/Home/workspace/github/seastar/contrib/src/protobuf \
  -DProtobuf_PROTOC_EXECUTABLE=${LIB_DIR}/contrib/protobuf/bin/protoc \
  -DProtobuf_LITE_LIBRARY=${LIB_DIR}/contrib/protobuf/lib/libprotobuf-lite.a \
  -DProtobuf_LIBRARY=${LIB_DIR}/contrib/protobuf/lib/libprotobuf.a \
  -DProtobuf_INCLUDE_DIRS=${LIB_DIR}/contrib/protobuf/include \
  -DProtobuf_USE_STATIC_LIBS=yes \
  -Dlksctp-tools_LIBRARY=${LIB_DIR}/contrib/lksctp-tools/lib/libsctp.a \
  -Dlksctp-tools_INCLUDE_DIR=${LIB_DIR}/contrib/lksctp-tools/include \
  -Dlz4_LIBRARY=${LIB_DIR}/contrib/lz4/lib/liblz4.a \
  -Dlz4_INCLUDE_DIR=${LIB_DIR}/contrib/lz4/include \
  -Dyaml-cpp_LIBRARY=${LIB_DIR}/contrib/yaml-cpp/lib/libyaml-cpp.a \
  -Dyaml-cpp_INCLUDE_DIR=${LIB_DIR}/contrib/yaml-cpp/include ..

#-Dyaml-cpp_LIBRARY=${LIB_DIR}/contrib/yaml-cpp/lib \
#-Dyaml-cpp_INCLUDE_DIR=${LIB_DIR}/contrib/yaml-cpp/include \
