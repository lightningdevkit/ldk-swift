#!/bin/bash

# When building from Xcode we want to ensure that `cargo` is in PATH.
# as a convenience, add the default cargo install location
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$PATH:${HOME}/.cargo/bin"

if ! [[ -x "$(command -v cargo)" ]]; then
    echo 'error: Unable to find cargo command. Cargo is not installed visit rustup.rs.' >&2
    exit 127
fi

set -e # stop execution upon the first error

C_BINDINGS_SOURCE_DIRECTORY="$(cd ${LDK_DIRECTORY}; pwd)/lightning-c-bindings"

BASEDIR=$(dirname "$0")
BUILD_LOG_PATH="${BASEDIR}/build_libldk.log"

# echo -n "" > $BUILD_LOG_PATH
touch $BUILD_LOG_PATH

echo "\n\nPlatform name: ${PLATFORM_NAME}" >> $BUILD_LOG_PATH
echo "Configuration: ${CONFIGURATION}" >> $BUILD_LOG_PATH
echo "LLVM Target Triple Suffix: ${LLVM_TARGET_TRIPLE_SUFFIX}" >> $BUILD_LOG_PATH

if [[ ${ACTION:-build} = "build" || $ACTION = "install" ]]; then
    TARGET_NAME="libldk"

    if [[ $PLATFORM_NAME = "" ]]; then
        # default for building with xcodebuild
        PLATFORM_NAME="macosx"
    fi

    if [[ $PLATFORM_NAME = "macosx" ]]; then
        if [[ $LLVM_TARGET_TRIPLE_SUFFIX = "-macabi" ]]; then
            RUST_TARGET_OS="ios-macabi"
        else
            RUST_TARGET_OS="darwin"
        fi
    else
        echo "PLATFORM_NAME ${PLATFORM_NAME}"
        RUST_TARGET_OS="ios"
    fi

    # Clean any pre-existing static libraries that doesn't align with what we're currently trying to build
    for ARCH in $ARCHS
    do
    	echo "Current Architecture: ${ARCH}" >> $BUILD_LOG_PATH
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
    	echo "CURRENT ARCHITECTURE: ${ARCH}"
        RUST_ARCH=$ARCH
        if [[ $RUST_ARCH = "arm64" ]]; then
            RUST_ARCH="aarch64"
            # This is because iOS Simulator builds for x86_64 is `x86_64-apple-ios`, while arm64 is `aarch64-apple-ios-sim`
            if [[ $PLATFORM_NAME = "iphonesimulator" ]]; then
                RUST_TARGET_OS="ios-sim"
            fi
        else
            if [[ $PLATFORM_NAME = "iphonesimulator" ]]; then
                RUST_TARGET_OS="ios"
            fi
        fi

        echo "BUILDING ${RUST_ARCH}-apple-${RUST_TARGET_OS}"

        cargo build -Z build-std=panic_abort,std --features "std" --target "${RUST_ARCH}-apple-${RUST_TARGET_OS}" $RUST_CONFIGURATION_FLAG
        EXECUTABLES+=("$C_BINDINGS_SOURCE_DIRECTORY/target/${RUST_ARCH}-apple-${RUST_TARGET_OS}/${RUST_CONFIGURATION}/${TARGET_NAME}.a")
    done

    rustup override unset

    mkdir -p "${BUILT_PRODUCTS_DIR}"
    xcrun --sdk $PLATFORM_NAME lipo -create "${EXECUTABLES[@]}" -output "${PROJECT_DIR}/${TARGET_NAME}.a"
fi
