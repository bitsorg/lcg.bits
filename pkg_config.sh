package: pkg_config
description: pkg-config helper tool for querying library compile/link flags
version: "0.29.2"
tag: "0.29.2"
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
  # Bake the multiarch triple into PC_PATH so bits pkg-config finds system .pc
  # files (prefer_system packages) without per-recipe PKG_CONFIG_PATH hacks.
  # /usr/lib64/pkgconfig covers RHEL/CentOS; missing paths are ignored.
  local _triple
  _triple=$(bits_triple)
  # macOS/Xcode 16 clang makes -Wint-conversion and implicit-function-declaration
  # hard errors, breaking the vendored glib 2.x. Downgrade both to warnings so
  # --with-internal-glib still compiles.
  bits_is_macos && export CFLAGS="${CFLAGS:+$CFLAGS }-Wno-error=int-conversion -Wno-error=implicit-function-declaration"
  ./configure --with-internal-glib --prefix=$INSTALLROOT \
    --with-system-include-path=/usr/include \
    --with-pc-path="/usr/lib/${_triple}/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig"
}
