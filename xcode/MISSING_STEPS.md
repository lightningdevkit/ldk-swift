```shell
# genbindings.sh, stable
rustup target add aarch64-apple-darwin

# compile_dependency_binaries.sh, stable
rustup target add aarch64-apple-ios
rustup target add x86_64-apple-ios

# compile_dependency_binaries.sh, nightly
rustup component add rust-src --toolchain nightly-x86_64-apple-darwin
rustup component add rust-src --toolchain nightly-2022-05-13-x86_64-apple-darwin


```
