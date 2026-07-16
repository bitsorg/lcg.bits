package: Toolchain
version: "%(tag_basename)s"
tag: v1.0
build_requires:
  - "GCC-Toolchain:(?!osx)"
# On macOS GCC-Toolchain is osx-disabled, so the build relies on the system toolchain:
# Xcode Command Line Tools (clang) plus a system/Homebrew gfortran (macOS ships none).
# Declare these a system_requirement on osx only, so a miss stops up front with a message.
system_requirement: "osx"
system_requirement_check: |
  # Xcode Command Line Tools installed, and clang/SDK actually compile.
  xcode-select -p >/dev/null 2>&1 || exit 1
  printf 'int main(void){return 0;}\n' | cc -xc - -o /dev/null 2>/dev/null || exit 1
  # A Fortran compiler (macOS has no built-in one).
  command -v gfortran >/dev/null 2>&1
system_requirement_missing: |
  The macOS developer toolchain is incomplete. The build needs both:
    * Xcode Command Line Tools (clang + SDK):
        xcode-select --install
    * gfortran (macOS has no built-in Fortran compiler), via Homebrew GCC:
        brew install gcc
  Install whichever is missing, ensure both are on PATH, then re-run the build.
---
mkdir -p $INSTALLROOT/etc/modulefiles
cp $GCC_TOOLCHAIN_ROOT/etc/modulefiles/GCC-Toolchain $INSTALLROOT/etc/modulefiles/GCC-${GCC_TOOLCHAIN_VERSION//-*}
ln -sf GCC-${GCC_TOOLCHAIN_VERSION//-*} $INSTALLROOT/etc/modulefiles/Toolchain
