#!/bin/bash

# Adapted from https://github.com/nvm-sh/nvm/issues/1706#issuecomment-575925257

source /usr/share/nvm/init-nvm.sh

# Update latest nodejs version
previous_nvm_version=$(nvm current)
nvm install node --latest-npm
nvm reinstall-packages $previous_nvm_version
nvm uninstall $previous_nvm_version
nvm cache clear
