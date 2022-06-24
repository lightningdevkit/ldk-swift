#!/bin/bash

# When building from Xcode we want to ensure that `cargo` is in PATH.
# as a convenience, add the default cargo install location
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$PATH:${HOME}/.cargo/bin"

LDK_DIRECTORY=$1 # directory to compile the C bindings in
C_BINDINGS_SOURCE_DIRECTORY="${LDK_DIRECTORY}/lightning-c-bindings"

usage() {
	echo "USAGE: path/to/ldk-c-bindings"
	exit 1
}

[ "${LDK_DIRECTORY}" = "" ] && echo "Usage: ./compile_dependency_binaries.sh /path/to/ldk-c-bindings" && exit 1;
[ ! -d "${LDK_DIRECTORY}" ] && echo "Provided directory does not exist" && exit 1;

if ! [[ -x "$(command -v cargo)" ]]; then
    echo 'error: Unable to find cargo command. Cargo is not installed visit rustup.rs.' >&2
    exit 127
fi

set -e # stop execution upon the first error

C_BINDINGS_SOURCE_DIRECTORY="$(cd ${LDK_DIRECTORY}; pwd)/lightning-c-bindings"
BUILT_PRODUCTS_DIR="`pwd`/binaries" # directory to copy the shared library and headers into


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

declare -a ARCHS=("arm64")

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

	mkdir -p "${BUILT_PRODUCTS_DIR}/${ARCH}"
	cp "$C_BINDINGS_SOURCE_DIRECTORY/target/${RUST_ARCH}-apple-${RUST_TARGET_OS}/${RUST_CONFIGURATION}/${TARGET_NAME}.a" "${BUILT_PRODUCTS_DIR}/${ARCH}"
done

rustup override unset

mkdir -p "${BUILT_PRODUCTS_DIR}"
xcrun --sdk $PLATFORM_NAME lipo -create "${EXECUTABLES[@]}" -output "${PROJECT_DIR}/${TARGET_NAME}.a"
