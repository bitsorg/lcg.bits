package: iwyu
description: Include-What-You-Use C/C++ header analysis tool
# IWYU is tied to the Clang/LLVM major version: 0.18 targets Clang 16, but this
# stack ships Clang 20 (the 0.18 build failed with classof-ambiguous LLVM API
# errors). 0.24 is the release for Clang 20.
version: "0.24"
source: https://github.com/include-what-you-use/include-what-you-use
tag: "iwyu-%(version)s"
sources:
  # The LCG mirror only carries older IWYU drops (LCG_109 ships 0.18 for its
  # Clang). This stack needs 0.24 for Clang 20, which is not on the mirror, so
  # fetch the 0.24 release tarball from upstream instead.
  - https://github.com/include-what-you-use/include-what-you-use/archive/refs/tags/%(version)s.tar.gz
requires:
  - CMake
  - Clang
# macOS: IWYU builds against a specific LLVM via find_package(LLVM), but Apple
# clang ships no LLVMConfig.cmake. Source IWYU from Homebrew (built against brew
# llvm) instead - standalone CLI, no consumers. Linux keeps building 0.24 below.
prefer_system: "osx.*"
homebrew_formula: include-what-you-use
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`
  # (pulls brew llvm); otherwise HomebrewRecipe reports the missing formula.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix include-what-you-use >/dev/null 2>&1; then
    brew install include-what-you-use >&2 || true
  fi
  echo "bits_system_replace: iwyu"
prefer_system_replacement_specs:
  iwyu:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin"
      HOMEBREW_FORMULA=include-what-you-use
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LLVM-exception
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
