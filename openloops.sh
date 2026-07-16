package: openloops
description: OpenLoops automated one-loop amplitude generator
version: "2.1.4.250729"
source: https://github.com/openloops/openloops
tag: "v%(version)s"
sources:
  # Upstream tarball is named after the base version (2.1.4); the trailing
  # ".250729" in our version string is the process-repository date used below.
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/OpenLoops-2.1.4.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# Derived from the version string "2.1.4.250729":
#   OL_VER  = 2.1.4   (source/tarball version)
#   OL_DATE = 250729  (process-repository snapshot date)
OL_VER="${PKGVERSION%.*}"
OL_DATE="${PKGVERSION##*.}"

# Full public process list installed by the first libinstall pass (mirrors
# lcgcmake LCG_109 openloops_public_proc).
OL_PUBLIC_PROC="ppllnnjj_ew ppllllbbbb_fac tbln tbln_ew tbqq tbw pptttt pptttt_ew pptt pptt_ew ppttbb ppttj ppttj_ew ppttjj pptaj pptajj pptllj pptlljj pptln pptw pptwj pptzj pptzjj ppthj ppthjj pptj pptjj ppjj ppjj_ew ppjjj ppjjj_ew ppjjj_nf5 ppjjjj pplllvvv_ew ppatt ppatt_ew ppattj pplltt pplltt_ew ppllttj ppllttj_ew pplntt pplnttj ppwtt ppwtt_ew ppwttj ppwttj_ew ppztt ppztt_ew ppzttj ppaatt ppwwtt ppzatt ppzztt ppvvvv ppaaaj2 ppllaa ppllaaj pplllla ppvvv ppvvv2 ppvvv_ew ppvvvj ppaajj ppaajj2 ppaajjj pplla pplla2 pplla_ew ppllaj ppllaj2 ppllaj_ew ppllaj_nf5 ppllajj ppllll ppllll2 ppllll2_nf5 ppllll2_onlyh ppllll_ew ppllllbb ppllllj ppllllj2 ppllllj2_nf5 ppllllj2_onlyh ppllnnjj_vbs pplnaj_ckm pplnajj pplnajj_ckm ppvv ppvv2 ppvv_ew ppvvj ppvvj2 ppvvj_ew ppwajj ppwwjj ppzajj ppzwj_ew ppzwjj ppzzjj ppajj ppajj2 ppajj_ew ppajjj ppllj ppllj2 ppllj_ew ppllj_nf5 pplljj pplljj_ew pplljjj pplnj_ckm pplnjj pplnjj_ckm pplnjj_ew pplnjjj ppnnjj_ew ppnnjjj ppvj ppvj2 ppvj_ew ppwj_ckm ppwjj ppwjj_ckm ppwjj_ew ppwjjj ppzjj ppzjj_ew ppzjjj pphtt pphtt_ew pphttj pphlltt pphll pphll2 pphll_ew pphllj pphllj2 pphllj_ew pphlljj pphlljj_top pphlnj_ckm pphlnjj pphv pphv_ew pphwjj pphz2 pphzj2 pphzjj pphhtt pphhv pphhh2 heftpphh heftpphhj heftpphhjj pphh2 pphhj2 pphhjj2 pphhjj_vbf bbhj heftpphj heftpphjj heftpphjjj pphbb pphbbj pphj2 pphjj2 pphjj_vbf pphjj_vbf_ew pphjjj2"
##############################
# Excludes so the downloaded source archive and bits' extraction/patch sentinels
# never reach the build copy or the install tree (this recipe installs by copying
# the whole tree).  Archive patterns are root-anchored.
_BITS_SRC_EXCLUDES=(
  --exclude '.bits_extracted' --exclude '.bits_patched' --exclude '*.downloading'
  --exclude '/*.tar'     --exclude '/*.tar.gz'  --exclude '/*.tgz'
  --exclude '/*.tar.bz2' --exclude '/*.tbz2'    --exclude '/*.tar.xz' --exclude '/*.txz'
  --exclude '/*.tar.zst' --exclude '/*.zip'
)
function Prepare() {
  rsync -av --delete --exclude '**/.git' "${_BITS_SRC_EXCLUDES[@]}" --delete-excluded "${SOURCEDIR}"/ ./

  # Numerical fix from LCG_109 (openloops-2.1.4.250729.patch): avoid an
  # unnecessary division by zero in the rank-1 bubble reduction.  Applied with a
  # sentinel so rebuilds are idempotent.
  local _f="lib_src/openloops/src/otf_reduction.F90"
  if [ -f "$_f" ] && ! grep -q 'msq(0)-msq(1)' "$_f"; then
    patch -p0 --forward <<'OLPATCH'
--- lib_src/openloops/src/otf_reduction.F90
+++ lib_src/openloops/src/otf_reduction.F90
@@ -1860,14 +1860,14 @@ subroutine twopoint_reduction(Gin,p,msq,B0coeff)
       !p^2 = 0 case
       if(abs(xi) == 0._/**/REALKIND) then
         B0coeff(1) = Gin(1)
-        B0coeff(2) = (-f0**2)*PPmu/msq(0)
-        B0coeff(3) = f1*(2*f0-f1)*PPmu/msq(1)
+        B0coeff(2) = -f0 * PPmu/(msq(0)-msq(1))
+        B0coeff(3) = (2*f0-f1) * PPmu/(msq(0)-msq(1))
         B0coeff(4) = -(f0+f1)*PPmu/2
       ! Expansion for p^2!=0 up to order xi^2
       else
         B0coeff(1) = Gin(1)
-        B0coeff(2) = f0*(-f0-2*f0*f1*xi -((2*f0+3*f1)*f0*f1)*xi**2)*(PPmu/msq(0))
-        B0coeff(3) = f1*((2*f0-f1) +2*xi*f0**2 + (xi**2)*(2*f0+3*f1)*f0**2)*(PPmu/msq(1))
+        B0coeff(2) = (-f0-2*f0*f1*xi -((2*f0+3*f1)*f0*f1)*xi**2)*(PPmu/(msq(0)-msq(1)))
+        B0coeff(3) = ((2*f0-f1) +2*xi*f0**2 + (xi**2)*(2*f0+3*f1)*f0**2)*(PPmu/(msq(0)-msq(1)))
         B0coeff(4) = (-(f0 +f1)/2 + xi*(one/3 - f0*(f0+f1)) + (-3*f0**3 - 47*f1*f0**2 - &
         11*f0*f1**2 + f1**3)*xi**2/12)*PPmu
       end if
OLPATCH
  fi
}

function Make() {
  # Without the gfortran free-line-length and $-ok flags the Fortran sources fail
  # to compile under gcc15 and ./scons never produces libopenloops.so. Mirrors
  # lcgcmake's openloops-213.cfg.
  cat > openloops.cfg <<'CFG'
[OpenLoops]
gfortran_f_flags =   -ffree-line-length-none -fdollar-ok
gfortran_f90_flags = -ffree-line-length-none -fdollar-ok
gfortran_f77_flags = -ffree-line-length-none -fdollar-ok
max_string_length = 400
CFG

  # Point the process loader at the matching snapshot repository and enable the
  # extra-process compilation, mirroring lcgcmake's default.cfg edits.
  local _cmodel="medium"
  [ "$(uname -m)" = "aarch64" ] && _cmodel="small"
  perl -i -pe 's/^process_repositories.*/process_repositories = matrix,powheg,ATLAS,public/' pyol/config/default.cfg
  perl -i -pe 's/^compile_extra.*/compile_extra = 1/' pyol/config/default.cfg
  perl -i -pe "s|^remote_process_url.*|remote_process_url = http://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/openloop-processes/${OL_DATE}/repositories|" pyol/config/default.cfg
  perl -i -pe "s/^cmodel.*/cmodel = ${_cmodel}/" pyol/config/default.cfg

  # Build the main OpenLoops library (libopenloops.so) first, then the process
  # libraries.  lcgcmake runs ./scons before any libinstall.
  ./scons
  ./openloops libinstall --jobs=${JOBS:-5} ${OL_PUBLIC_PROC} compile_extra=1
  perl -i -pe 's/^process_repositories.*/process_repositories = matrix,powheg,ATLAS/' pyol/config/default.cfg
  ./openloops libinstall --jobs=${JOBS:-5} all.coll compile_extra=1
  perl -i -pe 's/^process_repositories.*/process_repositories = matrix,powheg,ATLAS,public/' pyol/config/default.cfg
  ./openloops libinstall --jobs=${JOBS:-5} pphtt_nf compile_extra=1
  rm -rf process_obj process_src
}

function MakeInstall() {
  # rsync -a (== cp -a semantics) but lets us drop the source archive/sentinels.
  mkdir -p "$INSTALLROOT"
  rsync -a --exclude '**/.git' "${_BITS_SRC_EXCLUDES[@]}" --delete-excluded ./ "$INSTALLROOT/"
}
