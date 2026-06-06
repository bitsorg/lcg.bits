package: gettext
description: GNU gettext internationalisation and localisation library
version: "1.0"
tag: "1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
# On macOS use the Homebrew gettext instead of building from source (gnulib's
# strict iconv probe rejects macOS's system iconv, breaking the libtextstyle
# build). On Linux prefer_system does not match, so gettext is built as before.
prefer_system: "osx.*"
prefer_system_check: |
  #!/bin/bash -e
  # Homebrew gettext is keg-only; find its prefix and confirm libintl is usable.
  prefix=$(brew --prefix gettext 2>/dev/null) || prefix=/opt/homebrew/opt/gettext
  [ -n "$prefix" ] && [ -d "$prefix" ] || exit 1
  cc -x c - "-I${prefix}/include" -c -o /dev/null <<\EOF
  #include <libintl.h>
  int main(void) { return 0; }
  EOF
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # --disable-relocatable: the relocatable build pulls in gnulib's progreloc.c
  # which does not compile cleanly under GCC 15 / C23; bits installs to a fixed
  # prefix so relocation support is not needed.
  # CFLAGS -std=gnu17: keeps the rest of gnulib compatible with GCC 15.
  #
  # macOS: gnulib's strict "working iconv" probe rejects the system iconv over a
  # known minor round-trip bug (am_cv_func_iconv_works=no), leaving HAVE_ICONV
  # undefined -> iconv_ostream_create is compiled out of libtextstyle while
  # libtextstyle.sym still exports it -> "Undefined symbols: _iconv_ostream_create".
  # The system iconv is fine for the UTF-8 conversions this stack needs, so force
  # the cache var to accept it. (The proper alternative is GNU libiconv.) No
  # effect on Linux, where glibc iconv passes the probe.
  _iconv_works=""
  [ "$(uname)" = Darwin ] && _iconv_works="am_cv_func_iconv_works=yes"
  ./configure --prefix="$INSTALLROOT" \
    ${_iconv_works} \
    CFLAGS="${CFLAGS} -std=gnu17" \
    --disable-acl \
    --disable-csharp \
    --disable-curses \
    --disable-d \
    --disable-dependency-tracking \
    --disable-java \
    --disable-native-java \
    --disable-openmp \
    --disable-relocatable \
    --disable-rpath \
    --disable-silent-rules \
    --enable-nls \
    --enable-shared \
    --enable-static \
    --without-bzip2 \
    --without-emacs \
    --without-selinux \
    --without-xz
}
function MakeInstall() {
  make install-exec
}
