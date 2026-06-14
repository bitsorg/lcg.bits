package: bits-recipe-tools
version: "0.0.29"
tag: "v0.0.29"
source: https://github.com/bitsorg/bits-recipe-tools
---
mkdir -p $INSTALLROOT/bin
# Install the bits-include launcher into bin/.
install $SOURCEDIR/bits-* $INSTALLROOT/bin
# Install every recipe-tool helper (top-level regular files) into the package
# root so recipes can source them via `bits-include <Name>`. Iterating over all
# files (not a *Recipe pattern) auto-picks up new helpers like BitsArch.
for _f in "$SOURCEDIR"/*; do
  [ -f "$_f" ] || continue
  case "$(basename "$_f")" in
    bits-*|README*|LICENSE*|.*) continue ;;
  esac
  install "$_f" $INSTALLROOT
done

MODULEDIR="$INSTALLROOT/etc/modulefiles"
MODULEFILE="$MODULEDIR/$PKGNAME"
mkdir -p "$MODULEDIR"
cat > "$MODULEFILE" <<EoF
#%Module1.0
proc ModulesHelp { } {
  global version
  puts stderr "Modulefile for $PKGNAME $PKGVERSION-@@PKGREVISION@$PKGHASH@@"
}
set version $PKGVERSION-@@PKGREVISION@$PKGHASH@@
module-whatis "Modulefile for $PKGNAME $PKGVERSION-@@PKGREVISION@$PKGHASH@@"
# Dependencies
module load BASE/1.0
# Our environment
setenv BITS_RECIPE_TOOLS_ROOT \$::env(BASEDIR)/$PKGNAME/\$version
set BITS_RECIPE_TOOLS_ROOT \$::env(BASEDIR)/$PKGNAME/\$version
prepend-path PATH \$BITS_RECIPE_TOOLS_ROOT/bin
EoF
