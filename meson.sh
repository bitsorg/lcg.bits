package: meson
description: Meson fast and user-friendly software build system
version: "1.11.1"
tag: "1.11.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function MakeInstall() {
  mkdir -p "${SITE_PACKAGES}"
  "${PYTHON_EXE}" -m pip install \
    --no-deps --no-build-isolation --ignore-installed \
    --root=/ --prefix="${INSTALLROOT}" .
}

function PostInstall() {
  # pip's bin/meson can't import mesonbuild: its interpreter's sys.path lacks
  # MESON_ROOT site-packages, and bits sources init.sh (not the module file) when
  # building dependents. Replace it with a self-contained shell wrapper that adds
  # site-packages to PYTHONPATH itself.
  cat > "${INSTALLROOT}/bin/meson" <<'EOF'
#!/bin/sh
_dir="$(cd "$(dirname "$0")/.." && pwd)"
_pyver=$(python3 -c 'import sys; print("%d.%d" % sys.version_info[:2])' 2>/dev/null)
export PYTHONPATH="${_dir}/lib/python${_pyver}/site-packages${PYTHONPATH:+:${PYTHONPATH}}"
exec python3 -m mesonbuild.mesonmain "$@"
EOF
  chmod 755 "${INSTALLROOT}/bin/meson"
}