package: rivet
description: Rivet Monte Carlo analysis toolkit
version: "4.1.2"
mem_per_job: 1500
tag: "4.1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/Rivet-4.1.2.tar.bz2
requires:
  - hepmc3
  - yoda
  - fastjet
  - fjcontrib
  # Rivet 4 builds its Python bindings with SWIG (lcgcmake passes SWIG_LIB).
  - swig
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
  # Cython regenerates the pyext C++ from .pyx; the shipped sources use CPython
  # internals removed in Python 3.12+.
  - cython
license: GPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsPython)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# Put the bits Cython on PATH/PYTHONPATH at RECIPE SCOPE (reaches the Make step,
# not just Configure's subshell) so the pyext is regenerated for Python 3.13.
bits_enable_cython
# SWIG and its runtime library directory, as lcgcmake passes to Rivet 4.
export SWIG="${SWIG_ROOT}/bin/swig"
export SWIG_LIB="$(${SWIG_ROOT}/bin/swig -swiglib 2>/dev/null)"
##############################
# macOS: fastjet-config --libs reports -lemutls_w -lheapt_w (libgcc's emulated-
# TLS and heap-trace helper archives, dragged in by fastjet's gfortran Fortran
# plugins). Those archives live in Homebrew gcc's internal target lib dir, which
# is not on the linker's default search path, so Rivet's FastJet configure test
# (and the later link) fail with "ld: library 'emutls_w' not found". Add that
# gcc lib dir to LDFLAGS at recipe scope (reaches both configure and make) so
# -lemutls_w/-lheapt_w resolve to the real archives. Linux is unaffected (these
# libs are already on its default search path).
if [ "$(uname)" = Darwin ]; then
  _gcclib=$(dirname "$(${FC:-gfortran} -print-libgcc-file-name 2>/dev/null)" 2>/dev/null)
  [ -n "$_gcclib" ] && [ -d "$_gcclib" ] && export LDFLAGS="-L$_gcclib ${LDFLAGS:-}"
fi
##############################
function Configure() {
  (
  unset PYTHON_VERSION
  # Regenerate the Cython pyext rather than compiling the shipped *.cpp.
  [[ -n "$CYTHON_ROOT" ]] && rm -f pyext/rivet/*.cpp
  # gcc 15 / libstdc++ no longer transitively include <cstdint>; force-include it
  # (Rivet uses uintptr_t etc. via RivetSTL.hh). Keep the stack CXXFLAGS.
  ./configure --prefix="$INSTALLROOT" \
    --disable-silent-rules \
    --disable-pdfmanual \
    ${HEPMC3_ROOT:+--with-hepmc3="$HEPMC3_ROOT"} \
    ${YODA_ROOT:+--with-yoda="$YODA_ROOT"} \
    ${FASTJET_ROOT:+--with-fastjet="$FASTJET_ROOT"} \
    ${FJCONTRIB_ROOT:+--with-fjcontrib="$FJCONTRIB_ROOT"} \
    CXXFLAGS="${CXXFLAGS} -include cstdint" \
    SWIG_LIB="$SWIG_LIB"
  )
}
function PostInstall() {
  PYVER=$(python3 -c 'import sys; print("python%d.%d" % sys.version_info[:2])' 2>/dev/null || echo "python3")
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << MODEOF
prepend-path PYTHONPATH \$PKG_ROOT/lib/${PYVER}/site-packages
setenv RIVET_ANALYSIS_PATH \$PKG_ROOT/lib/Rivet
setenv RIVET_DATA_PATH \$PKG_ROOT/share/Rivet
MODEOF
}
