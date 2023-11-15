#!/bin/bash


if ! command -v micromamba >/dev/null 2>&1; then
    "${SHELL}" <(curl -L micro.mamba.pm/install.sh)
fi
