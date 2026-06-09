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
  # macOS: CepGen/CMakeLists.txt globs every CepGen subdirectory into
  # `core_includes` and passes them as per-subdir -I include paths
  # (EXT_HEADERS ${core_includes}). On macOS's case-insensitive filesystem those
  # paths make libc++'s `#include <math.h>` (from <cmath>) resolve to CepGen's
  # own CepGen/Utils/Math.h instead of the SDK header (likewise String.h/Limits.h
  # etc.), so every translation unit fails with "<cmath> tried including <math.h>
  # but didn't find libc++'s <math.h>". All CepGen code includes its headers
  # fully qualified ("CepGen/Utils/Math.h") via the project-root include
  # (include_directories(${PROJECT_SOURCE_DIR})), so the per-subdir paths are
  # redundant. Point EXT_HEADERS at the project root instead (already on the
  # include path; no header there shadows a standard one). Linux's case-sensitive
  # FS never had the collision and is unaffected (the patch is Darwin-only).
  [ "$(uname)" = Darwin ] && perl -i -pe \
    's/EXT_HEADERS \$\{core_includes\}/EXT_HEADERS \$\{PROJECT_SOURCE_DIR\}/' \
    "${SOURCEDIR}/CepGen/CMakeLists.txt"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_VERBOSE_MAKEFILE=ON
}
