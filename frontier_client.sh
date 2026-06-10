package: Frontier_Client
description: Frontier conditions/calibration data access client
version: "2.10.2"
tag: "2.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/frontier_client__2.10.2__src.tar.gz
requires:
  - expat
  - pacparser
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - Frontier_Client-2.10.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  # macOS ships no system OpenSSL headers, so point OPENSSL_DIR (which the
  # Makefile honours) at Homebrew's keg-only openssl@3.
  local openssl_dir="" make_extra=()
  if bits_is_macos; then
    openssl_dir=$(brew --prefix openssl@3 2>/dev/null) || openssl_dir=/opt/homebrew/opt/openssl@3
    if [ ! -f "$openssl_dir/include/openssl/md5.h" ]; then
      echo "Frontier_Client: Homebrew openssl@3 not found at $openssl_dir." >&2
      echo "Frontier_Client:   brew install openssl@3   (or re-run bits with --brew)" >&2
      exit 1
    fi
    # The Makefile auto-selects its macOS dylib path via `[ -f /usr/lib/libc.dylib ]`,
    # gone on modern macOS, so it falls to the ELF .so path emitting -Wl,-soname
    # (rejected by macOS ld). Force DYLIBTYPE=dylib; also strip -lrt (no librt on
    # macOS — clock_gettime is in libSystem).
    make_extra+=(DYLIBTYPE=dylib)
    # bits' relocate-me.sh rewrites the dylib's bare LC_ID_DYLIB to a long
    # absolute store path; without reserved header padding that rewrite fails, so
    # link with -headerpad_max_install_names to let the install name grow.
    sed -i.bak \
      -e 's/ -lrt//g' \
      -e 's/-dynamiclib/-dynamiclib -headerpad_max_install_names/' \
      Makefile
  fi
  # Frontier_Client's Makefile has no parallel-safe dependency between the
  # http sub-make (which creates http/.libs) and the top-level libfrontier_client.so
  # target that needs it.  Force serial build to avoid the race.
  make dist \
    PACPARSER_DIR="${PACPARSER_ROOT}" \
    EXPAT_DIR="${EXPAT_ROOT}" \
    ${openssl_dir:+OPENSSL_DIR="$openssl_dir"} \
    "${make_extra[@]}"
}

function MakeInstall() {
  # 'make dist' populates a dist/ subdirectory with the install tree
  cp -a dist/. "$INSTALLROOT/"
}
