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
  - vdt
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
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # gcc15 fix: CepGen wraps the extern "C" declarations of its Fortran COMMON
  # blocks (ktkin_, kincuts_, genparams_, evtkin_, constants_) in an anonymous
  # namespace. Under gcc15 that gives them internal C++ linkage
  # ((anonymous namespace)::ktkin_) instead of the plain C symbols the Fortran
  # side (Process/Fortran/cepgen_print.f) defines, so libCepGen.so ends up with
  # undefined references to them. Unwrap that one anonymous-namespace block so
  # the externs regain C linkage. Idempotent (the regex only matches the wrapped
  # form) and whitespace-tolerant.
  python3 - "${SOURCEDIR}/CepGen/Process/FortranFactorisedProcess.cpp" <<'PY'
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
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_VERBOSE_MAKEFILE=ON
}
