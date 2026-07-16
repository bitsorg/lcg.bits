package: libunwind
description: libunwind portable stack unwinding library
version: "1.5.0"
source: https://github.com/libunwind/libunwind
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
# macOS: do NOT build GNU/nongnu libunwind (doesn't target macOS; arm64 asm fails).
# macOS ships its own in the SDK, so use that (Homebrew's formula is Linux-only).
# prefer_system gated osx.* with no replacement spec; Linux keeps building below.
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
