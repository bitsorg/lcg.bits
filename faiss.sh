package: faiss
description: FAISS library for efficient similarity search (Facebook AI)
version: "1.11.0"
tag: "1.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - blas
  - Python
  - numpy
  - swig
  - packaging
  # macOS: Apple clang has no OpenMP; faiss does find_package(OpenMP REQUIRED).
  # Pull in Homebrew's libomp on macOS only (Linux uses GCC's built-in libgomp).
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
  # macOS: Apple clang has no built-in OpenMP, so FindOpenMP fails. Point it at
  # Homebrew's keg-only libomp (LIBOMP_ROOT) with the Apple-clang spelling
  # (-Xclang -fopenmp, not plain -fopenmp).
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
