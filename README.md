# TypeSpec Setup for Cursor

This repository contains a helper script to manually install the **TypeSpec VS Code extension** in [Cursor](https://www.cursor.so), which currently does **not support** installing it natively via the Cursor extension marketplace.

---

## 📌 Why this is needed

Cursor does not include the TypeSpec extension in its extension gallery. This setup circumvents that by:

1. Installing the TypeSpec extension in regular **Visual Studio Code**
2. Copying the extension files and configuration to the **Cursor** extension environment
3. Making TypeSpec available inside Cursor, with basic language support

---

## ⚠️ Compatibility Note

- **Do NOT use the latest version** of the TypeSpec extension — Cursor's engine is behind the latest VS Code API, and may break with newer versions.
- The script uses **TypeSpec extension v1.0.0**, which is known to work with recent Cursor builds.
- **Autoupdate is not supported** after installation. You will need to repeat this process manually if you want to upgrade later.

---

## 🧰 What the script does

The script:
1. Installs the TypeSpec compiler globally via `npm`
2. Installs a compatible version of the TypeSpec extension in VS Code
3. Copies the extension files to the Cursor extensions directory
4. Appends the extension configuration to Cursor’s internal `extensions.json`
5. Ensures `jq` is installed if not already available (via Homebrew)

---

## ✅ Requirements

- macOS
- [Homebrew](https://brew.sh) (for installing `jq`)
- `npm` installed
- Visual Studio Code installed (not just Cursor)
- `jq` (automatically installed if missing)

---

## 🚀 How to use

### Easiest way (one-liner):

```bash
curl -sSL https://raw.githubusercontent.com/YOUR_USERNAME/typespec-setup/main/enable-typespec.sh | bash
