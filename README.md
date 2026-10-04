# lcg.bits

`lcg.bits` is the shared recipe pool for the **LCG software stack**: about 1,100 [`bits`](https://github.com/bitsorg/bits) recipes for the HEP externals, Python/ML stack and Monte Carlo generators that lcgcmake builds (ROOT, Geant4, Python, CMake, pythia8, sherpa, …), plus the compiler toolchains (`GCC-Toolchain`, `Clang-Toolchain`). It holds recipes only: no `defaults-*.sh` profiles, no meta-packages and no CVMFS layout. Those live in [`stacks.bits`](https://github.com/bitsorg/stacks.bits), the shared stack base, which `requires: lcg.bits` and selects which branch of this repository a build uses.

Every LCG-based community builds on this pool through `stacks.bits`:

```
key4hep.bits ┐
ship.bits    │
lhcb.bits    ├── requires ──▶ stacks.bits ── requires ──▶ lcg.bits
atlas.bits   │
testbed.bits ┘
```

`lcg.bits` is registered in [bits-providers](https://github.com/bitsorg/bits-providers) as an `always_load` repository provider, so `bits` clones it automatically (into `sw/REPOS/lcg.bits/…`) whenever a build needs it. You normally never check it out yourself unless you are editing recipes.

## Getting started

Users normally do not clone `lcg.bits` directly. You do not build from this directory: it has no `defaults-release.sh`, so a build here would get none of the stack's compiler, C++ standard or build-type settings. Build from `stacks.bits` (or from your community's repository) and `bits` fetches the right `lcg.bits` branch for you. Install `bits` as described in the [bits README](https://github.com/bitsorg/bits#installation), then:

```bash
bits init stacks.bits && cd stacks.bits     # or: git clone -b LCG_110 https://github.com/bitsorg/stacks.bits
bits use build --architecture x86_64-el9 --defaults gcc14::opt --set release=LCG_110
bits build --dry-run ROOT                   # what would be reused and what built
bits build ROOT                             # one package and its dependencies
bits enter ROOT/latest                      # shell with ROOT loaded; `exit` to leave
```

`bits build externals` builds all externals and `bits build generators` the MC generators. `bits q` lists what was built (add `-a <arch>` to `bits q`/`bits enter` if several architectures are installed in the work directory). Check the machine with `bits doctor`. To build elsewhere, `export BITS_WORK_DIR=/path/to/sw`.

Any `package:` name in this repository can be built directly. Package names are the `package:` field of the recipe (`ROOT`, `Geant4`, `GCC-Toolchain`, `pythia8`), not necessarily the file name. The [stacks.bits README](https://github.com/bitsorg/stacks.bits#composing-profiles) explains the `--defaults` axes (compiler, build type, CUDA, release line) and the CVMFS layout.

## Notes for LCG users

### Branches and releases

| Branch | Role |
|---|---|
| `main` | Trunk. Used when no release is chosen (`release` = `main`). |
| `LCG_110` | The LCG 110 release recipes. |
| `devel` | Older development branch; not used by the default builds. |

The `stacks.bits` `dev3`/`dev4` nightly profiles need no branch of their own: they build the release branch's recipes with a few packages pinned to development heads or fixed tags.

The branch is chosen by the `release` variable that `stacks.bits` declares in `defaults-release.sh`:

```yaml
variables:
  release: main
overrides:
  lcg.bits:
    tag: "%(release)s"     # the lcg.bits branch to clone
```

Pass the release on the command line, `--set release=LCG_110`. That is the convention every stacks-based community follows, so packages hash identically across groups and are reused from the binary store instead of rebuilt. The same value also names the `{release}` level of the CVMFS path (`/cvmfs/bits.cern.ch/lcg/releases/LCG_110/…`); `main` drops that level. A new release is a new branch here named after it (`LCG_<NNN>`). Without `--set`, `bits` takes the release from a `release:` in the chosen profiles, else from the branch of the `stacks.bits` checkout (`LCG_110-patches` gives `LCG_110`), else `main`; the branch must exist here.

### Editing recipes

- Recipes are YAML headers plus a Bash body; most use the helpers from `bits-recipe-tools` (its recipe is in this repository; project: [bits-recipe-tools](https://github.com/bitsorg/bits-recipe-tools)). See [Writing Recipes with bits-recipe-tools](https://github.com/bitsorg/bits/blob/main/docs/COOKBOOK.md#writing-recipes-with-bits-recipe-tools).
- Patches applied by recipes are in [`patches/`](patches); the macOS Homebrew system layer is in [`macos/Brewfile`](macos/Brewfile).
- Release-specific version pins belong in a defaults profile (`stacks.bits` `defaults-dev3.sh`/`defaults-dev4.sh`, or a community overlay), not in a copy of the recipe. See [Override a package version without editing the recipe](https://github.com/bitsorg/bits/blob/main/docs/COOKBOOK.md#override-a-package-version-without-editing-the-recipe).
- To test a change, push it to a branch and build from `stacks.bits` with `--set release=<branch>`; `bits` clones that branch of `lcg.bits`.
- [`scripts/lcg2bits.py`](scripts/lcg2bits.py) is the converter that generated the initial recipes from lcgcmake's `heptools-*.cmake` and `CMakeLists.txt` files.

### Licence and compliance data

This repository is the source of the licence information for everything built from it. Each recipe header carries:

| Field | Meaning |
|---|---|
| `license:` | SPDX expression of the package's licence (present in every recipe). |
| `redistributable:` | Which forms may leave the build host: `all` (default), `binaries`, `sources`, `none`. Packages marked `none` are built and usable locally but never uploaded to the store or published to CVMFS. |
| `acknowledgment:` | Attribution text that must accompany the binaries. |

These fields do not enter package hashes, so correcting them never triggers a rebuild. At publish time `bits` turns them into a per-release `NOTICE`, `LICENSE-SOURCE-OFFER.txt` and CycloneDX/SPDX SBOMs. To audit:

```bash
bits compliance --recipes path/to/lcg.bits --no-store-check   # this pool's metadata only
cd stacks.bits                                                 # an LCG_110 checkout
bits compliance --defaults gcc14::opt externals generators     # the closure of a stack
```

`bits compliance` takes no `--set`, so run the second form in an `LCG_110` checkout of `stacks.bits`: the release then comes from the branch.

See [Licence compliance and redistribution policy](https://github.com/bitsorg/bits/blob/main/docs/REFERENCE.md#licence-compliance-and-redistribution-policy) and [bits compliance](https://github.com/bitsorg/bits/blob/main/docs/REFERENCE.md#bits-compliance).

### CI and publishing

[`.gitlab-ci.yml`](.gitlab-ci.yml) does not define builds. On a commit to the default branch (or a merge request) of the GitLab mirror it triggers the saved bits-console pipeline `communities/LCG/pipelines/on-commit.json`, which builds, publishes and certifies the configured LCG stack. Builds, platforms and the defaults chain are configured in [bits-console](https://gitlab.cern.ch/buncic/bits-console).

## More information

- Communities built on this pool: [key4hep.bits](https://github.com/bitsorg/key4hep.bits), [ship.bits](https://github.com/bitsorg/ship.bits), [lhcb.bits](https://github.com/bitsorg/lhcb.bits), [atlas.bits](https://github.com/bitsorg/atlas.bits), [testbed.bits](https://github.com/bitsorg/testbed.bits); [bits-providers](https://github.com/bitsorg/bits-providers): the provider registry
- [stacks.bits README](https://github.com/bitsorg/stacks.bits#readme): the defaults, axes, release selection and CVMFS layout used with this pool
- bits [User Guide](https://github.com/bitsorg/bits/blob/main/docs/USERGUIDE.md), [Cookbook](https://github.com/bitsorg/bits/blob/main/docs/COOKBOOK.md), [Reference](https://github.com/bitsorg/bits/blob/main/docs/REFERENCE.md), in particular [Repository Provider Feature](https://github.com/bitsorg/bits/blob/main/docs/REFERENCE.md#13-repository-provider-feature) and [Defaults Profiles](https://github.com/bitsorg/bits/blob/main/docs/REFERENCE.md#18-defaults-profiles)
- [bits-console](https://gitlab.cern.ch/buncic/bits-console): CI builds and CVMFS publishing

## License

GNU General Public License v3.0; see [LICENSE](LICENSE). The packages built from these recipes keep their own licences, recorded in each recipe's `license:` field.
