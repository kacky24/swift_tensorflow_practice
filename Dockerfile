FROM nvidia/cuda:10.0-base-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends \
    # build-essential \
    # git \
    # cmake \
    # ninja-build \
    clang \
    # python \
    # uuid-dev \
    # libicu-dev \
    # icu-devtools \
    # libedit-dev \
    # libxml2-dev \
    # libsqlite3-dev \
    # swig \
    libpython-dev \
    # libncurses5-dev \
    # pkg-config \
    # libcurl4-openssl-dev \
    # systemtap-sdt-dev \
    # tzdata \
    # rsync \
    libblocksruntime-dev \
    wget \
    && apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://storage.googleapis.com/swift-tensorflow-artifacts/releases/v0.6/rc2/deduped/swift-tensorflow-RELEASE-0.6-cuda10.0-cudnn7-ubuntu18.04.tar.gz \
    && tar xvzf swift-tensorflow-RELEASE-0.6-cuda10.0-cudnn7-ubuntu18.04.tar.gz \
    && rm swift-tensorflow-RELEASE-0.6-cuda10.0-cudnn7-ubuntu18.04.tar.gz

ENV PATH $(pwd)/usr/bin:"${PATH}"
