#!/bin/bash

# When building from Xcode we want to ensure that `cargo` is in PATH.
# as a convenience, add the default cargo install location
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$PATH:${HOME}/.cargo/bin"

if ! [[ -x "$(command -v cargo)" ]]; then
    echo 'error: Unable to find cargo command. If cargo is not installed visit rustup.rs, otherwise set CARGO_PATH in xi-mac/.env' >&2
    exit 127
fi

set -e # stop execution upon the first error

LDK_DIRECTORY=../../ldk-c-bindings # directory to compile the C bindings in
C_BINDINGS_SOURCE_DIRECTORY="${LDK_DIRECTORY}/lightning-c-bindings"

cp "${C_BINDINGS_SOURCE_DIRECTORY}/include/"*.h $PROJECT_DIR
cp "${LDK_DIRECTORY}/ldk-net/ldk_net."{c,h} $PROJECT_DIR

if [[ ${ACTION:-build} = "build" || $ACTION = "install" ]]; then
    TARGET_NAME="libldk"

    if [[ $PLATFORM_NAME = "" ]]; then
        # default for building with xcodebuild
        PLATFORM_NAME="macosx"
    fi

    if [[ $PLATFORM_NAME = "macosx" ]]; then
        RUST_TARGET_OS="darwin"
    elif [[ $PLATFORM_NAME = "iphonesimulator" ]]; then
        RUST_TARGET_OS="ios-sim"
    else
        RUST_TARGET_OS="ios"
    fi

    # Clean any pre-existing static libraries that doesn't align with what we're currently trying to build
    for ARCH in $ARCHS
    do
        if [[ $(lipo -info "${BUILT_PRODUCTS_DIR}/${TARGET_NAME}" 2>&1) != *"${ARCH}"* ]]; then
            rm -f "${BUILT_PRODUCTS_DIR}/${TARGET_NAME}"
        fi
    done

    if [[ $CONFIGURATION = "Debug" ]]; then
        RUST_CONFIGURATION="debug"
        RUST_CONFIGURATION_FLAG=""
    else
        RUST_CONFIGURATION="release"
        RUST_CONFIGURATION_FLAG="--release"
    fi

    pushd $C_BINDINGS_SOURCE_DIRECTORY
    export RUSTFLAGS='--cfg=c_bindings'

    rustup override set nightly
    cargo clean

    EXECUTABLES=()
    for ARCH in $ARCHS
    do
        RUST_ARCH=$ARCH
        if [[ $RUST_ARCH = "arm64" ]]; then
            RUST_ARCH="aarch64"
        fi

        cargo build -Z build-std=panic_abort,std --features "std" --target "${RUST_ARCH}-apple-${RUST_TARGET_OS}" $RUST_CONFIGURATION_FLAG
        EXECUTABLES+=("$C_BINDINGS_SOURCE_DIRECTORY/target/${RUST_ARCH}-apple-${RUST_TARGET_OS}/${RUST_CONFIGURATION}/${TARGET_NAME}.a")
    done

    rustup override unset

    mkdir -p "${BUILT_PRODUCTS_DIR}"
    xcrun --sdk $PLATFORM_NAME lipo -create "${EXECUTABLES[@]}" -output "${PROJECT_DIR}/${TARGET_NAME}.a"
fi
