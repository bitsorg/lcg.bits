package: cepgen
description: CepGen central exclusive production event generator
version: "1.2.5patch2"
tag: "1.2.5patch2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - apfel
  - Boost
  - lhapdf
  - pythia6
  - delphes
  - pythia8
  - GSL
  - HepMC
  - hepmc3
  - tbb
  - "vdt:(?!osx)"
  - photoscpp
  - tauolacpp
  - Python
  - jsonmcpp
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # gcc15 fix: CepGen wraps its Fortran COMMON-block extern "C" decls in an
  # anonymous namespace, giving them internal linkage so libCepGen.so has undefined
  # refs. Unwrap that block (idempotent). Patch the build COPY, not $SOURCEDIR.
  python3 - "$BITS_CMAKE_SRC/CepGen/Process/FortranFactorisedProcess.cpp" <<'PY'
import re, sys
f = sys.argv[1]
try:
    s = open(f).read()
except OSError:
    sys.exit(0)
pat = re.compile(
    r'namespace\s*\{\s*\n(\s*extern\s*"C"\s*\{.*?cepgen::ktblock::.*?\n\s*\})\s*\n\}\s*//\s*namespace',
    re.DOTALL)
if pat.search(s):
    open(f, "w").write(pat.sub(lambda m: m.group(1), s, count=1))
    print("cepgen: unwrapped anonymous namespace around Fortran-common externs")
else:
    print("cepgen: anonymous-namespace block not found (already patched / upstream changed)")
PY
  # macOS: subdir include globs make <math.h> resolve to Utils/Math.h on a
  # case-insensitive FS, so point EXT_HEADERS at the project root. Also drop
  # -lstdc++fs (in Apple libc++) and link libTauolaFortran into PhotosTauola.
  if bits_is_macos; then
    local _ptw="${BITS_CMAKE_SRC}/CepGenAddOns/PhotosTauolaWrapper/CMakeLists.txt"
    bits_file_replace "${BITS_CMAKE_SRC}/CepGen/CMakeLists.txt" \
      'EXT_HEADERS ${core_includes}' 'EXT_HEADERS ${PROJECT_SOURCE_DIR}'
    bits_strip_token "${BITS_CMAKE_SRC}/CepGen/CMakeLists.txt" \
      "${BITS_CMAKE_SRC}/CepGenAddOns/MadGraphWrapper/CMakeLists.txt" stdc++fs
    bits_file_insert_after "${_ptw}" '^find_library\(TAUOLAPP_HEPMC3 ' \
      'find_library(TAUOLAPP_FORTRAN TauolaFortran HINTS $ENV{TAUOLAPP_DIR} ${TAUOLAPP_DIR} PATH_SUFFIXES lib)'
    bits_file_replace "${_ptw}" \
      'list(APPEND EXT_LIBS ${TAUOLAPP} ${TAUOLAPP_HEPMC3})' \
      'list(APPEND EXT_LIBS ${TAUOLAPP} ${TAUOLAPP_HEPMC3} ${TAUOLAPP_FORTRAN})'
  fi
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_VERBOSE_MAKEFILE=ON
}
