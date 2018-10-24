#!/usr/bin/env bash

set -eou pipefail

# Installing nix
sh <(curl https://nixos.org/nix/install) --daemon

# Install nix-darwin
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer
