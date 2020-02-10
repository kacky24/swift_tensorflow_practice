ARG UBUNTU_VERSION=18.04
ARG ARCH=
ARG CUDA=10.1
FROM nvidia/cuda${ARCH:+-$ARCH}:${CUDA}-base-ubuntu${UBUNTU_VERSION} as base

ARG ARCH
ARG CUDA
ARG CUDNN=7.6.4.38-1
ARG CUDNN_MAJOR_VERSION=7
ARG LIB_DIR_PREFIX=x86_64
ARG LIBNVINFER=6.0.1-1
ARG LIBNVINFER_MAJOR_VERSION=6

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends \
    clang \
    libpython-dev \
    libblocksruntime-dev \
    wget

# RUN wget https://storage.googleapis.com/swift-tensorflow-artifacts/releases/v0.6/rc2/deduped/swift-tensorflow-RELEASE-0.6-cuda10.1-cudnn7-ubuntu18.04.tar.gz \
#     && tar xvzf swift-tensorflow-RELEASE-0.6-cuda10.1-cudnn7-ubuntu18.04.tar.gz \
#     && rm swift-tensorflow-RELEASE-0.6-cuda10.1-cudnn7-ubuntu18.04.tar.gz

RUN apt install -y --no-install-recommends \
    build-essential \
    git \
    # cmake \
    # ninja-build \
    # python \
    # uuid-dev \
    # libicu-dev \
    # icu-devtools \
    libedit-dev \
    libxml2-dev \
    # libsqlite3-dev \
    # swig \
    # libncurses5-dev \
    # pkg-config \
    libcurl4-openssl-dev \
    # systemtap-sdt-dev \
    # tzdata \
    # rsync \
    libatomic1 \
    libpython3.6-dev \
    cuda-command-line-tools-${CUDA/./-} \
    libcublas10=10.2.1.243-1 \
    cuda-nvrtc-${CUDA/./-} \
    cuda-cufft-${CUDA/./-} \
    cuda-curand-${CUDA/./-} \
    cuda-cusolver-${CUDA/./-} \
    cuda-cusparse-${CUDA/./-} \
    curl \
    libcudnn7=${CUDNN}+cuda${CUDA} \
    libfreetype6-dev \
    libhdf5-serial-dev \
    libzmq3-dev \
    pkg-config \
    software-properties-common \
    unzip \
    && apt clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH $(pwd)/usr/bin:"${PATH}"
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES utility,compute
