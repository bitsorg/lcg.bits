package: thrift
description: Apache Thrift scalable cross-language RPC framework
version: "0.16.0"
source: https://github.com/apache/thrift
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - pkg_config
  - Boost
  - yacc-like
# macOS: source Thrift from Homebrew (0.23.0 vs pinned 0.16.0; no older formula). The only
# consumer, Arrow, uses Thrift for stable Parquet metadata and supports a wide range.
# prefer_system gated osx.* so Linux builds 0.16.0 from source; revisit if Arrow won't link.
prefer_system: "osx.*"
homebrew_formula: thrift
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix thrift >/dev/null 2>&1; then
    brew install thrift >&2 || true
  fi
  echo "bits_system_replace: thrift"
prefer_system_replacement_specs:
  thrift:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib --pkgconfig --cmake"
      HOMEBREW_FORMULA=thrift
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - thrift-0.16.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS="-fPIC" \
    -DCMAKE_CXX_FLAGS="-fPIC" \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF \
    -DBUILD_TUTORIALS=OFF \
    -DWITH_C_GLIB=OFF \
    -DWITH_JAVA=OFF \
    -DWITH_PYTHON=OFF \
    -DWITH_NODEJS=OFF \
    -DWITH_JAVASCRIPT=OFF \
    -DWITH_CPP=ON \
    -DWITH_STATIC_LIB=ON \
    -DWITH_LIBEVENT=OFF \
    -DBoost_NO_BOOST_CMAKE=ON
}
