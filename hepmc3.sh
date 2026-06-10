package: hepmc3
description: HepMC3 Monte Carlo event record library
version: "3.3.1"
tag: "3.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/HepMC3-%(version)s.tar.gz
requires:
  - CMake
  - ROOT
  # Direct dep so Python_ROOT and Python_config_version_twodigit[_nodot] reach
  # the build env (ROOT only pulls Python transitively, not propagating them).
  - Python
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
  # macOS: find_package(Python) prefers Homebrew Python (installs bindings to an
  # unwritable path), and the existing SITEARCH/version overrides expand empty.
  # On Darwin pin the bits Python and compute its version explicitly.
  local _py=()
  if bits_is_macos; then
    # NB: the bits env var is PYTHON_ROOT (uppercase); the original
    # ${Python_ROOT} references above are a typo and expand empty.
    local _pyexe="${PYTHON_ROOT}/bin/python3"
    local _pyver _pynodot
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
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DROOT_DIR="${ROOT_ROOT}" \
    -DHEPMC3_INSTALL_INTERFACES=ON \
    -DHEPMC3_Python_SITEARCH${Python_config_version_twodigit_nodot}=$INSTALLROOT/lib/python${Python_config_version_twodigit}/site-packages \
    -DHEPMC3_PYTHON_VERSIONS="${Python_config_version_twodigit}" \
    "${_py[@]}"
}
