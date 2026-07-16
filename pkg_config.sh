package: pkg_config
description: pkg-config helper tool for querying library compile/link flags
version: "0.29.2"
source: https://gitlab.freedesktop.org/pkg-config/pkg-config
tag: "pkg-config-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pkg-config-0.29.2.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
patches:
  - pkg_config-0.29.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsMacOS)
. $(bits-include BitsArch)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Add the Ubuntu multiarch (and RHEL lib64) pkgconfig dirs to the compiled-in PC_PATH,
  # so bits-built pkg-config finds .pc files from system packages instead of every consumer
  # carrying ad hoc PKG_CONFIG_PATH. Non-existent paths are ignored.
  local _triple
  _triple=$(bits_triple)
  # macOS/Xcode 16 clang turns -Wint-conversion and implicit function declarations into hard
  # errors, breaking pkg-config's vendored glib; downgrade them so --with-internal-glib
  # compiles. No effect on Linux/gcc.
  bits_is_macos && export CFLAGS="${CFLAGS:+$CFLAGS }-Wno-error=int-conversion -Wno-error=implicit-function-declaration"
  ./configure --with-internal-glib --prefix=$INSTALLROOT \
    --with-system-include-path=/usr/include \
    --with-pc-path="/usr/lib/${_triple}/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig"
}
