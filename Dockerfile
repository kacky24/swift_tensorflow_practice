From nvidia/cuda:10.0-base-ubuntu18.04

Run apt update && \
    apt install -y --no-install-recommends \
    git \
    cmake \
    ninja-build \
    clang \
    python \
    uuid-dev \
    libicu-dev \
    icu-devtools \
    libedit-dev \
    libxml2-dev \
    libsqlite3-dev \
    swig \
    libpython-dev \
    libncurses5-dev \
    pkg-config \
    libcurl4-openssl-dev \
    systemtap-sdt-dev \
    tzdata \
    rsync \
    && apt clean && \
    rm -rf /var/lib/apt/lists/*

Run wget https://storage.googleapis.com/swift-tensorflow-artifacts/releases/v0.6/rc2/deduped/swift-tensorflow-RELEASE-0.6-cuda10.0-cudnn7-ubuntu18.04.tar.gz \
    && tar xzf swift-tensorflow-DEVELOPMENT-cuda10.0-cudnn7-ubuntu18.04.tar.gz

Env PATH $(pwd)/usr/bin:"${PATH}"
