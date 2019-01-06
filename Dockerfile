FROM gcc:8.2.0

# Install gcc arm compiler  
RUN curl -SL https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/8-2018q4/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2 | tar xj -C /opt/

# install cmake
RUN curl -SL https://github.com/Kitware/CMake/releases/download/v3.13.2/cmake-3.13.2-Linux-x86_64.sh --output cmake-pkg.sh &&\
  bash cmake-pkg.sh --skip-license --prefix=/usr/local/

# Set environment variables to use the arm compiler as default
ENV TARGET_TRIPLE arm-none-eabi
ENV COMPILER_ROOT /opt/gcc-arm-none-eabi-8-2018-q4-major
ENV AS=${COMPILER_ROOT}/bin/${TARGET_TRIPLE}-as     \
    AR=${COMPILER_ROOT}/bin/${TARGET_TRIPLE}-ar     \
    CC=${COMPILER_ROOT}/bin/${TARGET_TRIPLE}-gcc    \
    CPP=${COMPILER_ROOT}/bin/${TARGET_TRIPLE}-cpp   \
    CXX=${COMPILER_ROOT}/bin/${TARGET_TRIPLE}-g++   \
    LD=${COMPILER_ROOT}/bin/${TARGET_TRIPLE}-ld 

# Add arm compiler to path variable
ENV PATH ${COMPILER_ROOT}/bin:$PATH
