package: faiss
description: FAISS library for efficient similarity search (Facebook AI)
version: "1.11.0"
source: https://github.com/facebookresearch/faiss
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - blas
  - Python
  - numpy
  - swig
  - packaging
  # macOS: Apple clang has no OpenMP but faiss requires it; pull in Homebrew libomp on macOS only
  - "libomp:osx"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  # macOS: FindOpenMP fails on Apple clang, so point it at Homebrew libomp with the Apple-clang spelling (-Xclang -fopenmp)
  local _omp=()
  if bits_is_macos; then
    local _lomp="${LIBOMP_ROOT:-$(brew --prefix libomp 2>/dev/null)}"
    _omp+=(
      -DOpenMP_C_FLAGS="-Xclang -fopenmp -I${_lomp}/include"
      -DOpenMP_C_LIB_NAMES=omp
      -DOpenMP_CXX_FLAGS="-Xclang -fopenmp -I${_lomp}/include"
      -DOpenMP_CXX_LIB_NAMES=omp
      -DOpenMP_omp_LIBRARY="${_lomp}/lib/libomp.dylib"
    )
  fi
  # CPU-only build (this stack has no CUDA); generic SIMD level for portability.
  # Mirrors lcgcmake's faiss flags.
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DFAISS_ENABLE_GPU=OFF \
    -DFAISS_ENABLE_PYTHON=OFF \
    -DFAISS_OPT_LEVEL=generic \
    -DBUILD_TESTING=OFF \
    -DBUILD_SHARED_LIBS=ON \
    "${_omp[@]}"
}
