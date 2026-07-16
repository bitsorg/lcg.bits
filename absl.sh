package: absl
description: Abseil common C++ library collection (Google)
version: "20240722.1"
tag: "20240722.1"
sources:
  - https://github.com/abseil/abseil-cpp/archive/refs/tags/%(version)s.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # macOS: SHELL: quoting keeps the two-token -Xarch_<arch> flag as one arg.
  # perl (not sed -i) for GNU/BSD portability; braces escaped because Perl >=5.32
  # treats an unescaped '{' in a regex as a fatal error.
  perl -i -pe 's|list\(APPEND ABSL_RANDOM_RANDEN_COPTS "-Xarch_\$\{_arch\}" "\$\{_flag\}"\)|list(APPEND ABSL_RANDOM_RANDEN_COPTS "SHELL:-Xarch_\${_arch} \${_flag}")|' \
    absl/copts/AbseilConfigureCopts.cmake
}
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DABSL_BUILD_TESTING=OFF \
    -DABSL_ENABLE_INSTALL=ON \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_SHARED_LIBS=ON
}
