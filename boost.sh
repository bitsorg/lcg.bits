package: Boost
description: Boost C++ portable peer-reviewed libraries
version: "1.90.0"
mem_per_job: 1024
tag: "1.90.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/boost_1_90_0.tar.gz
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
  case $(uname) in
    Darwin) TOOLSET=clang ;;
    *) TOOLSET=gcc ;;
  esac

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
