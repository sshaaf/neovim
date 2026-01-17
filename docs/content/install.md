---
title: "Installation"
weight: 1
bookToc: true
---

# How to Install
Before starting, ensure you have:
- [Neovim](https://neovim.io/doc/install/) installed (v0.9+)
- JDK installed (Java 11 or later) , (I suggest use [SDKMan](https://sdkman.io/install/))
- This configuration installed at `~/.config/nvim`
- A [Nerd Font](https://www.nerdfonts.com/) installed and configured in your terminal

## First Time Setup

1. Open Neovim for the first time:
```bash
nvim
```

2. Lazy.nvim will automatically install all plugins. Wait for installation to complete.

3. Install the Java language server (jdtls):
```vim
:Mason
```
Navigate to `jdtls` and press `i` to install. Press `q` to quit Mason.
