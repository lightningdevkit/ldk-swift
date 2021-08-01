#FROM ubuntu:20.04
FROM swift:bionic

RUN apt-get -y update
RUN apt-get -y dist-upgrade
RUN apt-get install -y bash curl git make unzip build-essential python3 clang
# RUN apt-get install -y cargo

# install RUST
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

#RUN apt-get install -y valgrind
# RUN apt-get install -y python3
# RUN apt-get install -y lld
#RUN apt-get install -y git
#RUN apt-get install -y g++
# RUN apt-get install -y clang
# RUN apt-get install -y libxml2

COPY ci/LDKSwift ./ci/LDKSwift
COPY ci/fix_header_includes.py ./ci/
COPY ci/fix_swift_imports.py ./ci/
COPY ci/run_tests.sh ./ci/
COPY src ./src
COPY templates ./templates
COPY __main__.py ./

RUN rm -r ci/LDKSwift/Sources/LDKHeaders
RUN rm -r ci/LDKSwift/Sources/LDKSwift
RUN chmod +x ci/run_tests.sh

COPY bindings/batteries ci/LDKSwift/Sources/LDKSwift/batteries

ENV LDK_C_BINDINGS_BASE="/ldk-c-bindings"
ENV LDK_SWIFT_GENERATOR_INPUT_HEADER_PATH="/ldk-c-bindings/lightning-c-bindings/include/lightning.h"
ENV LDK_SWIFT_GENERATOR_OUTPUT_DIRECTORY_PATH="/ci/LDKSwift/Sources/LDKSwift"
ENV LLVM_CLANG_ASAN_PATH="/usr/lib/llvm-6.0/lib/clang/6.0.0/lib/linux/libclang_rt.asan-x86_64.a"
ENV RUST_BACKTRACE=1
ENV SHELL=/bin/bash
