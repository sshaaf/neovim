# Personal Neovim Configuration

This repository contains my personal Neovim (v0.11.3) configuration optimized for **Java and Rust development**. It leverages [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management and includes language-specific LSP, debugging, testing, AI integration, and modern productivity tools.

Feel free to use this as a reference or starting point for your own Neovim setup!

> **Inspiration:**
> This configuration was inspired by [Melkeydev's Neovim repo](https://github.com/Melkeydev/neovim), the YouTube talk ["How I use Neovim in 2024"](https://youtu.be/bVKA4Im2yTc?feature=shared), and [LazyVim's language extras](https://www.lazyvim.org/extras).

![Screenshot](screenshot.jpg)

## Features

### Language Support
- **Java:** Full jdtls LSP integration with debugging (DAP) and testing support
- **Rust:** rustaceanvim for advanced LSP features, crates.nvim for Cargo.toml management, codelldb debugger, and neotest integration

### Core Features
- **AI Integration:** Ollama, Gemini support for AI-assisted coding
- **Smart Completion:** nvim-cmp with LSP, buffer, path, and snippet sources
- **UI Enhancements:** Bufferline, lualine, colorschemes, indent guides
- **Theme Switcher:** Telescope-based theme picker with live preview and persistence (8 themes: tokyonight, ayu_dark, catppuccin, gruvbox, onedark, nord, nightfox, kanagawa)
- **File Explorer:** Nvim-tree with custom icons and keymaps
- **Fuzzy Finder:** Telescope for fast file and text search
- **Terminal Integration:** ToggleTerm for embedded terminals
- **Syntax Highlighting:** Treesitter with support for Java, Rust, TOML, RON, XML, JSON, Markdown, and more
- **Plugin Management:** Uses lazy.nvim for fast, lazy-loaded plugins

## Structure

The configuration is organized in a modular structure:
- `lua/neovim4j/plugins/java.lua` - Java-specific tooling
- `lua/neovim4j/plugins/rust.lua` - Rust-specific tooling
- `lua/neovim4j/plugins/lsp/lspconfig.lua` - General LSP configuration
- `lua/neovim4j/plugins/` - Other plugin configurations

> **Note:** The `neovim4j` directory name is historical from when this was Java-focused. It now supports multiple languages.

