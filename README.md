# ldk-swift

Automatic Swift bindings generation for [`rust-lightning`](https://github.com/lightningdevkit/rust-lightning).

## Installation

In order to use the automatically generated bindings, simply drag `*.xcframework` file into an Xcode project.

The `*.xcframework` files are either available on 
the [Releases](https://github.com/lightningdevkit/ldk-swift/releases) page, or can be [compiled](#Compilation)
from scratch.


## Compilation

### Prerequisites

- A Mac with Xcode
- Python3
- Rust

For Rust specifically, there are a couple additional requirements that can be installed once the Rust toolchain
is set up:

```shell
rustup target add aarch64-apple-darwin aarch64-apple-ios x86_64-apple-ios
cargo install cargo-lipo
```

### Cloning Dependencies

In order to generate these bindings from scratch, you will need to clone two dependency repositories:

**rust-lightning**, (a specific branch built for bindings compatibility) 
```shell
git clone --branch 2021-03-java-bindings-base git@github.com:TheBlueMatt/rust-lightning.git
```

**ldk-c-bindings**
```shell
git clone git@github.com:lightningdevkit/ldk-c-bindings.git
```

### Generating Rust-to-C-bindings

Now, navigate to the `ldk-c-bindings` directory and run the `genbindings.sh` script:

```shell
cd /path/to/ldk-c-bindings
./genbindings.sh /path/to/rust-lightning true
```

### Generating C-to-Swift-bindings

<details>
<summary>If using Docker</summary>

If you're using Docker to generate the Swift bindings, navigate (if you're not already there from the 
previous step) to the `ldk-c-bindings` directory and open the file located here:

`/path/to/ldk-c-bindings/lightning-c-bindings/Cargo.toml`

In that file, you will see four lines specifying the `lightning`, `lightning-persister`, `lightning-invoice`, and 
`lightning-background-processor` dependencies. They will most likely show local paths to the `rust-lightning` 
folder due to the previous `genbindings.sh` step. As Docker won't have access to local paths,
replace those lines with the following:

```yaml
lightning = { git = "https://github.com/thebluematt/rust-lightning", rev = "xxx", features = ["std"] }
lightning-persister = { git = "https://github.com/thebluematt/rust-lightning", rev = "xxx" }
lightning-invoice = { git = "https://github.com/thebluematt/rust-lightning", rev = "xxx" }
lightning-background-processor = { git = "https://github.com/thebluematt/rust-lightning", rev = "xxx" }
```

You will note that the revision is unspecified and is currently just placeholder `xxx`s. To obtain the revision, 
just navigate to the just clone custom `rust-lightning` directory and run:

```shell
cd /path/to/rust-lightning
git rev-parse HEAD
```

Take that commit hash and replace the `xxx` instances with it. 
</details>

#### Generating the Swift files

To generate the Swift files, navigate to the `ldk-swift` repository and run the following:

```shell
EXPORT LDK_SWIFT_GENERATOR_INPUT_HEADER_PATH="/path/to/ldk-c-bindings/lightning-c-bindings/include/lightning.h"
python3 ./
```

Now, the contents of the `bindings/LDK` folder will have been completely regenerated.

#### Generating the *.xcframework files

With the Swift files completely regenerated, you will need to make sure the Xcode projects that serve as bases
for the `*.xcframework`s reference them correctly. So navigate here:

`path/to/ldk-swift/xcode`

and open the respective `*.xcodeproj` files located in the `LDKFramework` and `LDKFramework_Mac` directories. 
Do the following steps for _both_ projects:

1. Remove the `LDK` references in the Xcode file tree
2. Drag the `path/to/ldk-swift/bindings/LDK` folder to that same location in the file tree
3. Check `Copy items if needed` and pick `Create groups` in the dialog box

Next, navigate back to the `xcode` directory, and run the following scripts:

```shell
./compile_dependency_binaries.sh /path/to/ldk-c-bindings
./build_framework.sh 
```

Finally, navigate to `path/to/ldk-swift/bindings/bin`, and you should find multiple `*.xcframework` files
waiting for you there.
