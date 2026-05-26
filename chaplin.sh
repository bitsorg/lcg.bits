package: chaplin
description: CHAPLIN complex harmonic polylogarithm library
version: "1.2"
tag: "1.2"
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
function Prepare() {
  # The CERN mirror tarball is double-gzipped: the outer .tar.gz decompresses
  # to an inner gzip-compressed .tar (not a plain tar), so bits' standard
  # tar xf fails.  Download and unpack both layers manually.
  # Note: %(version)s interpolation only works in YAML sources: fields;
  # hardcode the version here as is done in other manual-fetch recipes.
  curl -fSL \
    "https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/chaplin-1.2.tar.gz" \
    -o chaplin.tar.gz
  gunzip chaplin.tar.gz          # outer layer → chaplin.tar (still gzip-compressed)
  mv chaplin.tar chaplin.tar.gz  # rename so tar -xzf can read the inner gzip layer
  tar xzf chaplin.tar.gz --strip-components=1
  rm -f chaplin.tar.gz
  # chaplin-1.2 ships a 2009-era config.guess that doesn't recognise modern
  # build hosts (e.g. aarch64, modern x86_64 Linux).  Replace it with the
  # copy installed by the system automake package.
  cp "$(ls /usr/share/automake-*/config.guess 2>/dev/null | sort | tail -1)" \
    config.guess 2>/dev/null || true
}
