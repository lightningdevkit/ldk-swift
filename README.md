# ldk-swift

Automatic Swift bindings generation for [`rust-lightning`](https://github.com/lightningdevkit/rust-lightning).

## Installation

In order to use the automatically generated bindings, simply drag `*.xcframework` file into an Xcode project.

The `*.xcframework` files are either available on
the [Releases](https://github.com/lightningdevkit/ldk-swift/releases) page, or can be [compiled](#Compilation)
from scratch.


## Compilation

### Prerequisites

- A Mac with Xcode 13.2.1 or lower (this is because there is a bug with `cc` that prevents it from compiling for Mac Catalyst targets with clang 13)
- Python3
- Rust
- `gnu-sed` (optional; but will cut your compile times significantly!)

For Rust specifically, there are a couple additional requirements that can be installed once the Rust toolchain
is set up:

```shell
rustup toolchain install nightly
rustup target add aarch64-apple-darwin aarch64-apple-ios x86_64-apple-ios
cargo install cbindgen
```

### Cloning Dependencies

In order to generate these bindings from scratch, you will need to clone two dependency repositories:

**rust-lightning**, (a specific branch built for bindings compatibility)
```shell
git clone --branch 2022-06-108-java-bindings https://github.com/TheBlueMatt/rust-lightning /path/to/rust-lightning
```

**ldk-c-bindings**
```shell
git clone --branch v0.0.108.2 https://github.com/lightningdevkit/ldk-c-bindings /path/to/ldk-c-bindings
```

Take note of where you clone these directories, it's best you save the absolute path somewhere handy for the rest of the remaining steps.
### Generating Rust-to-C-bindings

Now, navigate to the `ldk-c-bindings` directory and run the `genbindings.sh` script:

```shell
pushd path/to/ldk-c-bindings
./genbindings.sh /path/to/rust-lightning true
popd
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
lightning = { git = "https://github.com/thebluematt/rust-lightning", branch = "2021-03-java-bindings-base", default-features = false }
lightning-persister = { git = "https://github.com/thebluematt/rust-lightning", branch = "2021-03-java-bindings-base", default-features = false }
lightning-invoice = { git = "https://github.com/thebluematt/rust-lightning", branch = "2021-03-java-bindings-base", default-features = false }
lightning-background-processor = { git = "https://github.com/thebluematt/rust-lightning", branch = "2021-03-java-bindings-base", default-features = false }
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
export LDK_SWIFT_GENERATOR_INPUT_HEADER_PATH="/path/to/ldk-c-bindings/lightning-c-bindings/include/lightning.h"
python3 ./
```

Now, the contents of the `bindings/LDK` folder will have been completely regenerated.

### Configuring Xcode for Framework Compilation
Go to the `xcode` folder and open `LDKFramework.xcworkspace`.

Then, navigate to the "LDKFramework" project and click on the LDKFramework project target:
![](https://user-images.githubusercontent.com/5944973/175575527-97073a18-76fc-4ab0-928f-d40ac643e607.png)

Search for `LDK_C_BINDINGS_BASE`:
![](https://user-images.githubusercontent.com/5944973/177420117-bcf7fc32-b07d-440f-84d1-fe2d373c355b.png)

Here, enter the absolute path, pointing to your `ldk-c-bindings`.

You will now also have to do the same for `LDK_C_BINDINGS_BINARY_DIRECTORY`, and enter any directory you wish. We like to use just `bin/`.

#### Generating the *.xcframework files

With all the bindings generated, you will just have to run two commands to generate the xcframework:

```shell
cd xcode
./build_framework.sh
```

Once the script finishes running, you should see `LDKFramework.xcframework` in the `xcode/build` folder. Drag that into your project, and you're done!
