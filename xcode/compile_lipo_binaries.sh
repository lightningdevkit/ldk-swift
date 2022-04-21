set -e # stop execution upon the first error

LDK_DIRECTORY=$1 # directory to compile the C bindings in
C_BINDINGS_SOURCE_DIRECTORY="${LDK_DIRECTORY}/lightning-c-bindings"

pushd ../bindings/lipo-input
BIN_OUTPUT_DIRECTORY=`pwd`
popd

usage() {
	echo "USAGE: path/to/ldk-c-bindings"
	exit 1
}

[ "${LDK_DIRECTORY}" = "" ] && echo "Usage: ./compile_dependency_binaries.sh /path/to/ldk-c-bindings" && exit 1;
[ ! -d "${LDK_DIRECTORY}" ] && echo "Provided directory does not exist" && exit 1;


# lipo "${BIN_OUTPUT_DIRECTORY}/x86_64-apple-ios-macabi/libldk.a" "${BIN_OUTPUT_DIRECTORY}/x86_64-apple-darwin/libldk.a" "${BIN_OUTPUT_DIRECTORY}/ios/libldk.a" -create -output "${BIN_OUTPUT_DIRECTORY}/libldk.a"
lipo "${BIN_OUTPUT_DIRECTORY}/x86_64-apple-ios-macabi/libldk.a" "${BIN_OUTPUT_DIRECTORY}/ios/libldk.a" -create -output "${BIN_OUTPUT_DIRECTORY}/libldk.a"
exit 0



# build for Catalyst
pushd $C_BINDINGS_SOURCE_DIRECTORY
#export RUSTFLAGS=""
#export RUSTFLAGS="-Z sanitizer=address"
#export RUSTFLAGS="--cfg=c_bindings --cfg=feature=\"std\" --cfg=feature=\"bitcoin/std\" --cfg=feature=\"lightning/std\" --cfg=feature=\"lightning-invoice/std\""
export RUSTFLAGS="--cfg=c_bindings"
#export RUSTFLAGS="--cfg=c_bindings --cfg=feature=\"default\" --cfg=feature=\"std\""
#export RUSTFLAGS="--cfg=c_bindings --cfg=feature=\"default\""
#export RUSTFLAGS="--cfg=c_bindings -C lto=off -C embed-bitcode=no"
#export RUSTFLAGS="--cfg=c_bindings -C lto=off -Z embed-bitcode"

# sanity check
#cargo rustc -- --print cfg
#cargo build --target x86_64-apple-ios-macabi --release
#exit

# Mac ABI binary (disable temporarily) TODO: reenable
# it might be necessary to run "sudo xcode-select --switch /Library/Developer/CommandLineTools" here
sudo xcode-select --switch /Library/Developer/CommandLineTools
rustup override set nightly


# declare -a target_architectures=("aarch64-apple-ios-macabi" "x86_64-apple-ios-macabi" "aarch64-apple-darwin" "x86_64-apple-darwin")
#declare -a target_architectures=("x86_64-apple-ios-macabi" "x86_64-apple-darwin")
declare -a target_architectures=("aarch64-apple-ios-macabi" "aarch64-apple-darwin")
declare -i architecture_count=${#target_architectures[@]}
for (( i=0; i<$architecture_count; i++ ));
do
    CURRENT_ARCHITECTURE=${target_architectures[$i]}
    cargo clean
    cargo build -Z build-std=panic_abort,std --features "std" --target $CURRENT_ARCHITECTURE --release
    mkdir -p "${BIN_OUTPUT_DIRECTORY}/${CURRENT_ARCHITECTURE}"
    cp "${C_BINDINGS_SOURCE_DIRECTORY}/target/${CURRENT_ARCHITECTURE}/release/libldk.a" "${BIN_OUTPUT_DIRECTORY}/${CURRENT_ARCHITECTURE}/"
done


# iOS & Simulator binaries
# it might be necessary to run "sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer"
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
rustup override unset
cargo clean
cargo lipo --features "std" --release
mkdir -p $BIN_OUTPUT_DIRECTORY/ios
cp "${C_BINDINGS_SOURCE_DIRECTORY}/target/universal/release/libldk.a" $BIN_OUTPUT_DIRECTORY/ios/


lipo "${BIN_OUTPUT_DIRECTORY}/x86_64-apple-ios-macabi/libldk.a" "${BIN_OUTPUT_DIRECTORY}/x86_64-apple-darwin/libldk.a" "${BIN_OUTPUT_DIRECTORY}/ios/libldk.a" -create -output "${BIN_OUTPUT_DIRECTORY}/libldk.a"




