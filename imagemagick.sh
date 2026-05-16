package: imagemagick
description: ImageMagick software suite for image conversion and editing
version: "7.0.8.7"
tag: "7.0.8.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ImageMagick-7.0.8.7.tar.gz
requires:
  - fftw
  - graphviz
  - fontconfig
  - freetype
  - png
  - zlib
  - libxml2
  # optional:
  # - pango
build_requires:
  - bits-recipe-tools
license: LicenseRef-ImageMagick
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --disable-openmp --prefix=$INSTALLROOT
}
