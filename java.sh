package: java
description: OpenJDK Java Development Kit
version: "17.0.18p8"
tag: "17.0.18p8"
sources:
  - "((?!osx).*x86[-_]64.*)https://lcgpackages.web.cern.ch/tarFiles/sources/openjdk-%(version)s-linux-x64.tar.gz"
  - "((?!osx).*aarch64.*)https://lcgpackages.web.cern.ch/tarFiles/sources/openjdk-%(version)s-linux-aarch64.tar.gz"
# macOS: no prebuilt OpenJDK tarball for osx, so source the JDK from Homebrew
# (openjdk@17). prefer_system gated osx.* so Linux keeps unpacking the tarball
# above; the bin/java symlink resolves to the real keg so the JDK self-locates.
prefer_system: "osx.*"
homebrew_formula: openjdk@17
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix openjdk@17 >/dev/null 2>&1; then
    brew install openjdk@17 >&2 || true
  fi
  echo "bits_system_replace: java"
prefer_system_replacement_specs:
  java:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin"
      HOMEBREW_FORMULA=openjdk@17
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only WITH Classpath-exception-2.0
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
