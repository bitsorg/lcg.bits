package: xgboost
description: XGBoost scalable distributed gradient boosting library
version: "2.1.3"
tag: "2.1.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - numpy
  - scipy
  # optional:
  # - spark
  # - scikitlearn
build_requires:
  - bits-recipe-tools
  - CMake
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --cmake --python"
##############################
# The C++ library, headers and CMake config (LHCb's Rec links it), and the
# Python package from the same source using that library.
_py="${PYTHON_ROOT:-$Python_ROOT}/bin/python3"
PYTHON_MAJOR_MINOR=$("$_py" -c 'import sys; print("%d.%d" % sys.version_info[:2])')
function Configure() {
  # Apple clang has no OpenMP.
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" -DCMAKE_INSTALL_PREFIX="$INSTALLROOT" \
    -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=Release $(bits_is_macos && echo -DUSE_OPENMP=OFF)
}
function PostInstall() {
  local lib=libxgboost.so
  bits_is_macos && lib=libxgboost.dylib
  local site="$INSTALLROOT/lib/python${PYTHON_MAJOR_MINOR}/site-packages"
  mkdir -p "$site"
  cp -R "$SOURCEDIR/python-package/xgboost" "$site/"
  local l   # drop 0.90's links into its source tree
  for l in $(find "$site/xgboost" -type l); do [ -e "$l" ] || rm "$l"; done
  # The package looks for its library in xgboost/lib/.
  mkdir -p "$site/xgboost/lib"
  ln -sfn "../../../../$lib" "$site/xgboost/lib/$lib"
  [ -f "$site/xgboost/lib/$lib" ]
}
