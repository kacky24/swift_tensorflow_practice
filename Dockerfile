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
    curl \
    && apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://storage.googleapis.com/swift-tensorflow-artifacts/releases/v0.11/rc2/swift-tensorflow-RELEASE-0.11-cuda10.1-cudnn7-ubuntu18.04.tar.gz
RUN tar -xvzf swift-tensorflow-RELEASE-0.11-cuda10.1-cudnn7-ubuntu18.04.tar.gz --directory /
RUN rm swift-tensorflow-RELEASE-0.11-cuda10.1-cudnn7-ubuntu18.04.tar.gz

RUN apt update && \
    apt install -y --no-install-recommends \
    build-essential \
    clang \
    libedit-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libatomic1 \
    cuda-command-line-tools-${CUDA/./-} \
    libcublas10=10.2.1.243-1 \
    cuda-nvrtc-${CUDA/./-} \
    cuda-cufft-${CUDA/./-} \
    cuda-curand-${CUDA/./-} \
    cuda-cusolver-${CUDA/./-} \
    cuda-cusparse-${CUDA/./-} \
    libcudnn7=${CUDNN}+cuda${CUDA} \
    && apt clean && \
    rm -rf /var/lib/apt/lists/*


ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES utility,compute
