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
  # No source to compile; install IJulia into INSTALLROOT, which acts as a Julia depot
  export JULIA_DEPOT_PATH="$INSTALLROOT"
  # IJulia installs its Jupyter kernelspec into the Jupyter data dir, which
  # defaults to ~/.local/share/jupyter on Linux (and ~/Library/Jupyter on macOS).
  # The build sandbox has HOME unset, so on Linux that resolves to /.local and
  # mkdir fails (EACCES); macOS writes outside the sandbox (EPERM). Point
  # JUPYTER_DATA_DIR into INSTALLROOT on every platform so the kernelspec lands in
  # the package; PostInstall adds JUPYTER_PATH so Jupyter finds it at runtime.
  export JUPYTER_DATA_DIR="$INSTALLROOT/share/jupyter"
  mkdir -p "$JUPYTER_DATA_DIR"
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
  # The kernelspec lives under the package (see Make(), all platforms); expose it
  # so Jupyter discovers the Julia kernel at runtime.
  echo 'prepend-path JUPYTER_PATH $PREFIX/share/jupyter' >> "$MODULEFILE"
}
