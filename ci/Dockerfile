#FROM ubuntu:20.04
FROM swift:5.6-focal

RUN apt-get -y update
RUN apt-get -y dist-upgrade
RUN apt-get install -y bash curl git make unzip build-essential python3
# RUN apt-get install -y cargo

# install RUST
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# install llvm/clang 11
RUN curl -SL https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz | tar -xJC .

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

RUN rm -rf ci/LDKSwift/Sources/LDKHeaders
RUN rm -rf ci/LDKSwift/Sources/LDKSwift
RUN chmod +x ci/run_tests.sh

COPY bindings/batteries ci/LDKSwift/Sources/LDKSwift/batteries
# COPY bindings/LDK/. ci/LDKSwift/Sources/LDKSwift

# RUN ln -s /lib/x86_64-linux-gnu/libtinfo.so.5 /lib/x86_64-linux-gnu/libtinfo.so.6

ENV LDK_C_BINDINGS_BASE="/ldk-c-bindings"
ENV LDK_SWIFT_GENERATOR_INPUT_HEADER_PATH="/ldk-c-bindings/lightning-c-bindings/include/lightning.h"
ENV LDK_SWIFT_GENERATOR_OUTPUT_DIRECTORY_PATH="/ci/LDKSwift/Sources/LDKSwift"
ENV LLVM_CLANG_ASAN_PATH="/clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04/lib/clang/11.0.0/lib/linux/libclang_rt.asan-x86_64.a"
ENV ASAN_SYMBOLIZER_PATH="/clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04/bin/llvm-symbolizer"
ENV PATH="/clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04/bin:${PATH}"
ENV RUST_BACKTRACE=1
ENV RUSTFLAGS="--cfg=c_bindings"
ENV SHELL=/bin/bash
