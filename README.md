# ldk-swift

Automatic Swift bindings generation for [`rust-lightning`](https://github.com/lightningdevkit/rust-lightning).

## Installation

In order to use the automatically generated bindings, simply drag `*.xcframework` file into an Xcode project.

The `*.xcframework` files are either available on
the [Releases](https://github.com/lightningdevkit/ldk-swift/releases) page, or can be [compiled](#Compilation)
from scratch.

## Compilation

### Prerequisites

-   A machine running macOS
-   Xcode 13.2.1 or lower (this is because there is a bug with `cc` that prevents it from compiling for Mac Catalyst targets with clang 13)
-   [Python3](https://programwithus.com/learn/python/install-python3-mac)
-   [Rust](https://www.rust-lang.org/tools/install)
-   [GNU sed](https://formulae.brew.sh/formula/gnu-sed) (optional, but will cut your compile times significantly!)

For Rust specifically, there are a couple additional requirements that can be installed once the Rust toolchain
is set up:

```shell
rustup toolchain install nightly
rustup target add aarch64-apple-darwin aarch64-apple-ios x86_64-apple-ios
cargo install cbindgen
```

### Cloning Dependencies

In order to generate these bindings from scratch, you will need to clone two dependency repositories:

**[rust-lightning](https://github.com/lightningdevkit/rust-lightning)**, (a specific branch built for bindings compatibility):

```shell
git clone --branch 2022-06-108-java-bindings https://github.com/TheBlueMatt/rust-lightning /path/to/rust-lightning
```

**[ldk-c-bindings](https://github.com/lightningdevkit/ldk-c-bindings)**:

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

### Preparing the correct Xcode version

To make sure the next two steps work correctly, you need to verify that you're using Xcode 13.2.1.
If you have a later version, you can download the correct version from here: https://xcodereleases.com/

The direct download link is

https://developer.apple.com/services-account/download?path=/Developer_Tools/Xcode_13.2.1/Xcode_13.2.1.xip

You may be asked to log in to your Apple developer account.

After downloading the correct Xcode version and copying it to Applications, you might also need to run
the following command with root privileges:

```shell
sudo xcode-select -s /Applications/Xcode\ 13.2.1.app/Contents/Developer/
```

### Building requisite binaries

Navigate (`cd`) to the `./src/scripts` folder, and run the following Python script:

```shell
python3 ./build_bulk_libldks.py /path/to/ldk-c-bindings
```

This command will take a while, but it will eventually produce a set of binaries for all the
platform/architecture combinations we're trying to support. Those binaries should adhere to the
`./bindings/bin/release/<platform>/` folder pattern.

Each of those folders will contain an `architectures` directory with subdirectories such as `arm64`
or `x86_64`, as well as a `libldk.a` file, which is the `lipo` product of all the targeted
architectures.

#### Generating the \*.xcframework files

With all the binaries generated, still in the `./src/scripts` directory, you just need to run one
last Python script to produce the framework:

```shell
python3 ./generate_xcframework.py /path/to/ldk-c-bindings
```

Once the script finishes running, you should see `LightningDevKit.xcframework` in the
`./bindings/bin/release` folder. Drag that into your project, and you're done!
