#!/usr/bin/env bash

set -o errexit

# --- Install Node.js (required for Tailwind/CSS bundling) ---
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs
corepack enable

# --- Ensure bin/rails is executable ---
chmod +x bin/rails

yarn install || npm install

# --- Create public/assets directory if it doesn't exist ---
mkdir -p public/assets

bundle install
bin/rails assets:precompile
bin/rails assets:clean