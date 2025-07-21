#!/bin/bash

# Step 0: Ensure jq is installed
command -v jq >/dev/null 2>&1 || brew install jq

# Step 1: Install TypeSpec compiler globally
npm install -g @typespec/compiler

# Step 2: Alias VS Code CLI and install TypeSpec extension
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
code --install-extension typespec.typespec-vscode@1.0.0

# Step 3: Copy TypeSpec extension folder from VS Code to Cursor
cp -r ~/.vscode/extensions/typespec.typespec-* ~/.cursor/extensions/

# Step 4: Extract TypeSpec extension config from VS Code
typespec=$(jq -c '.[] | select(.identifier.id=="typespec.typespec-vscode")' ~/.vscode/extensions/extensions.json)

# Step 5: Add config to Cursor if not already present
if ! grep -q '"id":"typespec.typespec-vscode"' ~/.cursor/extensions/extensions.json; then
  sed -i '' '$s/]//' ~/.cursor/extensions/extensions.json       # remove closing ]
  echo "  ,$typespec" >> ~/.cursor/extensions/extensions.json   # append new config
  echo "]" >> ~/.cursor/extensions/extensions.json              # re-add closing ]
fi
