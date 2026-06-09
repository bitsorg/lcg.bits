package: jl_ijulia
description: IJulia Julia kernel for Jupyter notebooks
version: "1.29.0"
tag: "1.29.0"
requires:
  - julia
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS=""
##############################
function Make() {
  # No source to compile.  Install the IJulia package into INSTALLROOT,
  # which acts as a Julia depot (registries/, packages/, artifacts/, ...).
  export JULIA_DEPOT_PATH="$INSTALLROOT"
  # macOS: IJulia's build installs its Jupyter kernelspec into the user's
  # ~/Library/Jupyter/kernels, which is outside the build sandbox -> mkdir EPERM
  # ("operation not permitted"). Redirect Jupyter's data dir into INSTALLROOT so
  # the kernelspec is written inside the package; PostInstall adds JUPYTER_PATH
  # to the module so Jupyter finds it at runtime. (Linux writes to the builder
  # home as before, so its behaviour is unchanged.)
  if bits_is_macos; then
    export JUPYTER_DATA_DIR="$INSTALLROOT/share/jupyter"
    mkdir -p "$JUPYTER_DATA_DIR"
  fi
  julia -e '
    import Pkg
    Pkg.add(Pkg.PackageSpec(name="IJulia", version="1.29.0"))
    Pkg.precompile()
  '
}

function MakeInstall() {
  : # Julia wrote directly to INSTALLROOT during Make(); nothing to install.
}

function PostInstall() {
  # Append a JULIA_DEPOT_PATH prepend to the generated modulefile so that
  # Julia finds this depot at runtime.  PostInstall runs after MakeModule.
  echo 'prepend-path JULIA_DEPOT_PATH $PREFIX' >> "$MODULEFILE"
  # macOS: the kernelspec lives under the package (see Make()); expose it so
  # Jupyter discovers the Julia kernel at runtime.
  bits_is_macos && echo 'prepend-path JUPYTER_PATH $PREFIX/share/jupyter' >> "$MODULEFILE"
}
