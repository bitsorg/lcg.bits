package: Toolchain
version: "%(tag_basename)s"
tag: v1.0
build_requires:
  - "GCC-Toolchain:(?!osx)"
# On Linux the toolchain (incl. gfortran) comes from GCC-Toolchain above. macOS
# ships no Fortran compiler and GCC-Toolchain is osx-disabled, so Fortran
# packages rely on a system/Homebrew gfortran being on PATH. Declare it a
# system_requirement on osx only: when gfortran is present the package is taken
# from the system (the body below is not run); when it is missing the build
# stops up front with an actionable message instead of failing deep in a
# Fortran package.
system_requirement: "osx"
system_requirement_check: |
  command -v gfortran >/dev/null 2>&1
system_requirement_missing: |
  gfortran was not found on this macOS system, but the LCG/key4hep Fortran
  packages need it (macOS has no built-in Fortran compiler).
    * Install Homebrew's GCC, which provides gfortran:
        brew install gcc
    * Make sure `gfortran` is on your PATH, then re-run the build.
---
mkdir -p $INSTALLROOT/etc/modulefiles
cp $GCC_TOOLCHAIN_ROOT/etc/modulefiles/GCC-Toolchain $INSTALLROOT/etc/modulefiles/GCC-${GCC_TOOLCHAIN_VERSION//-*}
ln -sf GCC-${GCC_TOOLCHAIN_VERSION//-*} $INSTALLROOT/etc/modulefiles/Toolchain
