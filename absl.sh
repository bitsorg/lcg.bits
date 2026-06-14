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
  # macOS: cmake SHELL: quoting is required when passing two-token -Xarch_<arch>
  # flags; without it the second token is treated as a separate argument.
  perl -i -pe 's|list\(APPEND ABSL_RANDOM_RANDEN_COPTS "-Xarch_\${_arch}" "\${_flag}"\)|list(APPEND ABSL_RANDOM_RANDEN_COPTS "SHELL:-Xarch_\${_arch} \${_flag}")|' \
    absl/copts/AbseilConfigureCopts.cmake
}
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DABSL_BUILD_TESTING=OFF \
    -DABSL_ENABLE_INSTALL=ON \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_SHARED_LIBS=ON
}
