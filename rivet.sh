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
  # macOS: hdf5 is transitive via YODA (libYODA references @rpath/libhdf5.*.dylib).
  # Declaring it exports HDF5_ROOT so the recipe can bake an rpath into pyext core.so
  # (else the build-time import test can't load it). osx-gated so Linux's hash is unchanged.
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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# SWIG + runtime lib dir, as lcgcmake passes to Rivet 4 (relocated on macOS).
export SWIG="${SWIG_ROOT}/bin/swig"
export SWIG_LIB="$(bits_swig_lib)"
##############################
if bits_is_macos; then
  # fastjet-config advertises gcc runtime libs (-lemutls_w/-lgfortran/-lquadmath)
  # that Apple clang can't find. Add both gcc dirs: the static helper archives and
  # the libgfortran/libquadmath dylibs.
  export LDFLAGS="$(bits_macos_relocatable_ldflags) ${LDFLAGS:-}"
  _gcclib=$(dirname "$(${FC:-gfortran} -print-libgcc-file-name 2>/dev/null)" 2>/dev/null)
  _fclib=$(dirname "$(${FC:-gfortran} -print-file-name=libgfortran.dylib 2>/dev/null)" 2>/dev/null)
  [ -n "$_gcclib" ] && [ -d "$_gcclib" ] && export LDFLAGS="-L$_gcclib ${LDFLAGS:-}"
  [ -n "$_fclib" ] && [ -d "$_fclib" ] && export LDFLAGS="-L$_fclib ${LDFLAGS:-}"
  # core.so links libhdf5 transitively via YODA but Rivet adds no rpath, so the
  # build-time `import rivet` can't dlopen it; bake one in (HDF5_ROOT from the
  # osx-gated require).
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
