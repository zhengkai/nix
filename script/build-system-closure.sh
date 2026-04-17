#! /usr/bin/env bash

cd "$(dirname "$(readlink -f "$0")")" || exit 1

nix-store --export "$(nix-store -qR /run/current-system)" > ../system.closure
