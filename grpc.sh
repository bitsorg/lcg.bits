package: grpc
description: gRPC high-performance open-source universal RPC framework
version: "1.62.3"
tag: "1.62.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - absl
  - c_ares
  - re2
  - protobuf
  - zlib
prefer_system: osx.*
prefer_system_check: |
  printf "#include \"grpcpp/version_info.h\"\n" | cc -I$(brew --prefix grpc)/include -xc++ -std=c++20 - -c -o /dev/null

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - grpc-1.62.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=lib \
    -G Ninja \
    -DgRPC_INSTALL:Bool=ON \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_SHARED_LIBS=ON \
    ${OPENSSL_ROOT:+-DOPENSSL_ROOT_DIR="$OPENSSL_ROOT"} \
    -DgRPC_BUILD_CODEGEN=ON \
    -DgRPC_BUILD_CSHARP_EXT:Bool=OFF \
    -DgRPC_ABSL_PROVIDER:String=package \
    -DgRPC_CARES_PROVIDER:String=package \
    -DgRPC_SSL_PROVIDER:String=package \
    -DgRPC_ZLIB_PROVIDER:String=package \
    -DgRPC_RE2_PROVIDER:String=package \
    -DgRPC_PROTOBUF_PROVIDER:String=package \
    -DgRPC_USE_PROTO_LITE:Bool=OFF \
    -DgRPC_PROTOBUF_PACKAGE_TYPE:String=CONFIG \
    -DgRPC_BUILD_TESTS:BOOL=OFF \
    -DgRPC_GFLAGS_PROVIDER:String=none \
    -DgRPC_BENCHMARK_PROVIDER:String=none \
    -DgRPC_BUILD_GRPC_PHP_PLUGIN=OFF \
    -DgRPC_BUILD_GRPC_OBJECTIVE_C_PLUGIN=OFF \
    -DgRPC_BUILD_GRPC_NODE_PLUGIN=OFF \
    -DgRPC_BUILD_GRPC_CSHARP_PLUGIN=OFF \
    -DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF \
    -DgRPC_BUILD_GRPC_CPP_PLUGIN=ON \
    -DgRPC_BUILD_GRPC_PYTHON_PLUGIN=ON
}
