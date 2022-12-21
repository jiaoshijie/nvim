FROM alpine:latest AS base

# ENV http_proxy=http://192.168.31.174:7890
# ENV https_proxy=http://192.168.31.174:7890

LABEL maintainer="jiaoshijie"

ARG BUILD_DEPS="autoconf automake build-base cmake ninja coreutils curl gettext-tiny-dev git libtool pkgconf unzip"
ARG NVIM_TAG=stable

RUN apk add --no-cache ${BUILD_DEPS} && \
  git clone --depth 1 https://github.com/neovim/neovim.git /tmp/neovim && \
  cd /tmp/neovim && \
  git fetch origin -t --depth 1 && \
  git checkout ${NVIM_TAG} && \
  make CMAKE_BUILD_TYPE=Release install && \
  strip /usr/local/bin/nvim
