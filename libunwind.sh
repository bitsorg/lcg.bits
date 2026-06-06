package: libunwind
description: libunwind portable stack unwinding library
version: "1.5.0"
tag: "1.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
# macOS: do NOT build the GNU/nongnu libunwind (it does not target macOS; its
# arm64 sysv asm also fails). macOS ships its own libunwind in the SDK
# (<libunwind.h>) and the system libraries, so use that. (Homebrew's libunwind
# formula is Linux-only — `requirements: linux`, no macOS bottle — so it is not
# an option here.) prefer_system is gated osx.*; with no replacement spec, bits
# treats libunwind as a system package on macOS and consumers resolve it from
# the default SDK paths. Linux keeps building from source below.
prefer_system: "osx.*"
prefer_system_check: |
  #!/bin/bash
  # macOS SDK provides <libunwind.h> and the unwinder in the system libraries.
  printf '#include <libunwind.h>\nint main(void){ return 0; }\n' \
    | cc -x c - -c -o /dev/null 2>/dev/null && exit 0
  echo "libunwind: <libunwind.h> not found in the macOS SDK." >&2
  exit 1
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT CC=$CC CXX=$CXX
}
