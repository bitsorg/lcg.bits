package: bits-recipe-tools
version: "0.0.19"
tag: "v0.0.19"
source: https://github.com/bitsorg/bits-recipe-tools
---
mkdir -p $INSTALLROOT/bin
install $SOURCEDIR/*Recipe $INSTALLROOT
install $SOURCEDIR/bits-* $INSTALLROOT/bin

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
