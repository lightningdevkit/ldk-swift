set -e
set -x

pushd ../
# working within /

LDK_SWIFT_GENERATOR_INPUT_HEADER_PATH="ldk-c-bindings/lightning-c-bindings/include/lightning.h" python3 ./

mkdir -p /ci/LDKSwift/Sources/LDKHeaders/include/
cp /ldk-c-bindings/lightning-c-bindings/include/*.h /ci/LDKSwift/Sources/LDKHeaders/include/
cp /ldk-c-bindings/ldk-net/ldk_net.h /ci/LDKSwift/Sources/LDKHeaders/include/
cp /ldk-c-bindings/ldk-net/ldk_net.c /ci/LDKSwift/Sources/LDKHeaders/

popd
# working within /ci

python3 ./fix_header_includes.py
python3 ./fix_swift_imports.py
pushd LDKSwift/
swift test
