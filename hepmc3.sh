package: hepmc3
description: HepMC3 Monte Carlo event record library
version: "3.3.1"
tag: "3.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/HepMC3-%(version)s.tar.gz
requires:
  - CMake
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function Configure() {
  # macOS: CMake's find_package(Python) prefers Homebrew's Python over the bits
  # Python, so HepMC3 builds the bindings for the wrong interpreter and installs
  # into /opt/homebrew (EPERM). Pin the interpreter to the bits Python and compute
  # its version from PYTHON_ROOT so the bindings install into INSTALLROOT. Darwin-
  # gated: on Linux _py is empty and the cmake line is byte-identical to before.
  local _py=()
  if bits_is_macos; then
    local _pyexe="${PYTHON_ROOT}/bin/python3" _pyver _pynodot
    _pyver=$("$_pyexe" -c 'import sys;print("%d.%d"%sys.version_info[:2])' 2>/dev/null)
    [ -z "$_pyver" ] && _pyver=$(basename "$(ls -d "${PYTHON_ROOT}"/lib/python3.* 2>/dev/null | head -1)" | sed 's/python//')
    _pynodot=${_pyver//./}
    _py+=(
      -DPython_EXECUTABLE="${_pyexe}"
      -DPython3_EXECUTABLE="${_pyexe}"
      -DHEPMC3_Python_SITEARCH${_pynodot}="${INSTALLROOT}/lib/python${_pyver}/site-packages"
      -DHEPMC3_PYTHON_VERSIONS="${_pyver}"
    )
  fi
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DROOT_DIR="${ROOT_ROOT}" \
    -DHEPMC3_INSTALL_INTERFACES=ON \
    -DHEPMC3_Python_SITEARCH${Python_config_version_twodigit_nodot}=$INSTALLROOT/lib/python${Python_config_version_twodigit}/site-packages \
    -DHEPMC3_PYTHON_VERSIONS="${Python_config_version_twodigit}" \
    "${_py[@]}"
}
