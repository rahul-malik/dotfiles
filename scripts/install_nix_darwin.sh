#!/usr/bin/env bash

set -eou pipefail

# Installing nix
curl https://nixos.org/nix/install | sh

# Install nix-darwin
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer
