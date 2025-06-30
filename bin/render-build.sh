#!/usr/bin/env bash

set -o errexit

# Ensure node is available and yarn is enabled
corepack enable

# Ensure bin/rails is executable
chmod +x bin/rails

bundle install

npm install

# Create missing public/assets folder
mkdir -p public/assets

bin/rails assets:precompile
bin/rails assets:clean