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
# macOS: source ImageMagick from Homebrew. It's a heavy tool+lib suite pulling in
# many delegate libraries (png/jpeg/tiff/freetype/webp/...) that is painful to
# build against the current macOS SDK; brew bundles them all. brew imagemagick is
# 7.1.x (same major as the pinned 7.0.8.7, so MagickCore/MagickWand API stays
# compatible) and has no consumers in the stack, so version drift is irrelevant.
# prefer_system gated osx.* so Linux keeps building 7.0.8.7 from source below.
prefer_system: "osx.*"
homebrew_formula: imagemagick
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix imagemagick >/dev/null 2>&1; then
    brew install imagemagick >&2 || true
  fi
  echo "bits_system_replace: imagemagick"
prefer_system_replacement_specs:
  imagemagick:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib --pkgconfig"
      HOMEBREW_FORMULA=imagemagick
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-ImageMagick
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --disable-openmp --prefix=$INSTALLROOT
}
