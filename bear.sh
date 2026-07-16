package: bear
description: Bear tool that generates a compile_commands.json database
version: "3.1.5"
source: https://github.com/rizsotto/Bear
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - jsonmcpp
  - grpc
  - spdlog
# macOS: source Bear from Homebrew. It's a standalone CLI (no consumers), and
# building from source breaks on the macOS toolchain (grpc/protobuf, spdlog/fmt).
# brew's 4.1.4 vs pinned 3.1.5 is fine; osx.* gate keeps Linux on the source build.
prefer_system: "osx.*"
homebrew_formula: bear
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix bear >/dev/null 2>&1; then
    brew install bear >&2 || true
  fi
  echo "bits_system_replace: bear"
prefer_system_replacement_specs:
  bear:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin"
      HOMEBREW_FORMULA=bear
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_UNIT_TESTS=OFF \
    -DENABLE_FUNC_TESTS=OFF
}
