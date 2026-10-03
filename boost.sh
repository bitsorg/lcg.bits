package: Boost
description: Boost C++ portable peer-reviewed libraries
version: "1.91.0"
mem_per_job: 1024
tag: "1.91.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/boost_1_91_0.tar.gz
requires:
  - CMake
  - Python
  - zlib
  - xz
  - bzip2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSL-1.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc --cmake"
##############################
function Configure() {
  true
}
function Make() {
  # Compiler family by signal, not OS: the clang axis sets CXX=clang++ and tags
  # the arch -clang; the gcc axis leaves CXX unset. uname (Darwin => Apple clang)
  # is only the last-resort fallback, so a clang-on-Linux build uses clang too.
  if [[ "${CXX:-}" == *clang* || "${ARCHITECTURE:-}" == *-clang* || "$(uname)" == Darwin ]]; then
    TOOLSET=clang
  else
    TOOLSET=gcc
  fi

  # Pass Python to bootstrap so it writes the correct 'using python' jam
  # entry into project-config.jam and b2 builds boost_python.
  # Try the bits-standard env var names; fall back silently if Python not found.
  _py_root="${PYTHON_ROOT:-${Python_ROOT}}"
  _py_opts=""
  if [[ -n "$_py_root" && -x "${_py_root}/bin/python3" ]]; then
    _py_opts="--with-python=${_py_root}/bin/python3 --with-python-root=${_py_root}"
  fi

  # shellcheck disable=SC2086
  ./bootstrap.sh --with-toolset=$TOOLSET ${_py_opts}

  ./b2 --prefix="$INSTALLROOT" toolset=$TOOLSET ${JOBS:+-j$JOBS} install
}
function MakeInstall() {
  true
}
