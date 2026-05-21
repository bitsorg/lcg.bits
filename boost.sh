package: Boost
description: Boost C++ portable peer-reviewed libraries
version: "1.90.0"
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
  ./bootstrap.sh --with-toolset=$TOOLSET

  # Append explicit Python configuration so b2 builds boost_python against
  # our bits-managed Python rather than any system Python.
  _py_root="${PYTHON_ROOT:-${Python_ROOT}}"
  if [[ -n "$_py_root" ]]; then
    _py_exe="${_py_root}/bin/python3"
    _py_ver=$("${_py_exe}" -c 'import sys; print("%d.%d" % sys.version_info[:2])')
    _py_inc=$("${_py_exe}" -c 'import sysconfig; print(sysconfig.get_path("include"))')
    # Search for the Python shared library; match versioned names too
    # (e.g. libpython3.12.so.1.0 as installed by bits Python).
    _py_lib=$(find "${_py_root}/lib" \
                \( -name "libpython${_py_ver}.so"     \
                   -o -name "libpython${_py_ver}m.so"  \
                   -o -name "libpython${_py_ver}.so.*" \
                   -o -name "libpython${_py_ver}.dylib" \) \
                -print -quit 2>/dev/null)
    # Fall back to the plain lib dir if the library file wasn't found.
    _py_libdir="${_py_root}/lib"
    [[ -n "$_py_lib" ]] && _py_libdir="$(dirname "${_py_lib}")"
    echo "using python : ${_py_ver} : ${_py_exe} : ${_py_inc} : ${_py_libdir} ;" \
      >> project-config.jam
  fi

  ./b2 --prefix="$INSTALLROOT" toolset=$TOOLSET ${JOBS:+-j$JOBS} install
}
function MakeInstall() {
  true
}
