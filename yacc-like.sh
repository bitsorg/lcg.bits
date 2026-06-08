package: yacc-like
version: "1.0"
system_requirement_missing: |
   Please install bison and flex develpment package on your system.
   If they are there, make sure you have them in your default path.
system_requirement: ".*"
system_requirement_check: |
   command -v bison && command -v flex
# macOS ships an ancient bison (2.3); consumers like bdsim need >= 2.4. List the
# Homebrew bison (3.8, keg-only) so `brew bundle` / `bits --brew` installs it.
# (homebrew_formula only feeds the macOS Brewfile generator; it does not change
# this system_requirement check, which still passes on any platform with a bison
# on PATH. Consumers that need the newer bison point at `brew --prefix bison`.)
homebrew_formula: bison
---
