package: bear
description: Bear tool that generates a compile_commands.json database
version: "3.1.5"
tag: "3.1.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - jsonmcpp
  - grpc
  - spdlog
# macOS: source Bear from Homebrew. Bear is a standalone CLI tool that generates
# compile_commands.json (no consumers in the stack), and building it from source
# drags in grpc/protobuf codegen + an spdlog/fmt version match that breaks on the
# current macOS toolchain. brew bear is 4.1.4 vs the pinned 3.1.5 — fine for a CLI
# tool with no library consumers. prefer_system gated osx.* so Linux keeps
# building 3.1.5 from source below.
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
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_UNIT_TESTS=OFF \
    -DENABLE_FUNC_TESTS=OFF
}
