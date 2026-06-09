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
  # macOS only: hdf5 is a transitive dependency via YODA (libYODA references
  # @rpath/libhdf5.NNN.dylib). Declaring it here on Darwin exports HDF5_ROOT so
  # the recipe can bake an rpath to it into the pyext core.so (the build-time
  # import test otherwise fails: "Library not loaded: @rpath/libhdf5.310.dylib").
  # Arch-gated to osx so Linux's resolved dependency set (and hash) is unchanged.
  - "hdf5:osx"
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
# macOS: fastjet-config --libs reports the gcc runtime libs -lemutls_w -lheapt_w
# -lgfortran -lquadmath (dragged in by fastjet's gfortran Fortran plugins). The
# compiler here is Apple clang (g++ is a clang symlink), which does not know any
# of Homebrew gcc's lib dirs, so Rivet's FastJet configure test (and the later
# link) fail with "ld: library 'emutls_w' not found" / "'gfortran' not found".
# These libs live in two gcc dirs: the static helper archives (libemutls_w.a,
# libheapt_w.a, libgcc.a) under the internal target dir, and the shared
# libgfortran/libquadmath dylibs one level up under lib/gcc/current/. Add both to
# LDFLAGS at recipe scope (reaches configure and make) so all resolve. Linux is
# unaffected (its real gcc already has these on the default search path).
if [ "$(uname)" = Darwin ]; then
  # Reserve Mach-O header pad on every Rivet link (libRivet via libtool and the
  # pyext core.so via g++ -shared). bits' post-build relocation runs
  # `install_name_tool -id <long final path>` on the installed libraries; without
  # padding the longer install name overflows the load commands and relocation
  # fails silently - the recipe log ends in `return 0` but bits reports BUILD
  # FAILED and no .build-hash is written. Linux uses GNU ld and ignores this.
  export LDFLAGS="-Wl,-headerpad_max_install_names ${LDFLAGS:-}"
  _gcclib=$(dirname "$(${FC:-gfortran} -print-libgcc-file-name 2>/dev/null)" 2>/dev/null)
  _fclib=$(dirname "$(${FC:-gfortran} -print-file-name=libgfortran.dylib 2>/dev/null)" 2>/dev/null)
  [ -n "$_gcclib" ] && [ -d "$_gcclib" ] && export LDFLAGS="-L$_gcclib ${LDFLAGS:-}"
  [ -n "$_fclib" ] && [ -d "$_fclib" ] && export LDFLAGS="-L$_fclib ${LDFLAGS:-}"
  # Bake an rpath to hdf5 into everything Rivet links (notably the pyext core.so):
  # libYODA references @rpath/libhdf5.NNN.dylib transitively, but Rivet only adds
  # rpaths for its direct deps (yoda/fastjet/hepmc3), not hdf5, so the build-time
  # `import rivet` test fails to dlopen core.so ("Library not loaded:
  # @rpath/libhdf5.310.dylib"). HDF5_ROOT is exported via the osx-gated require.
  [ -n "${HDF5_ROOT:-}" ] && export LDFLAGS="-Wl,-rpath,${HDF5_ROOT}/lib ${LDFLAGS:-}"
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
