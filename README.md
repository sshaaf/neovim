# Personal Neovim Configuration

This repository contains my personal Neovim (v0.11.3) configuration optimized for **Java and Rust development**. It leverages [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management and includes language-specific LSP, debugging, testing, AI integration, and modern productivity tools.

Originally started as a Java-focused config, it has evolved into a polyglot development environment. Feel free to use this as a reference or starting point for your own Neovim setup!

> **Inspiration:**
> This configuration was inspired by [Melkeydev's Neovim repo](https://github.com/Melkeydev/neovim), the YouTube talk ["How I use Neovim in 2024"](https://youtu.be/bVKA4Im2yTc?feature=shared), and [LazyVim's language extras](https://www.lazyvim.org/extras).

![Screenshot](screenshot.jpg)

## Features

### Quick Reference
**Don't know the keybindings?** Just press `<Space>` and wait! The which-key popup shows all available commands organized by category.
- Press `<Space>?` or `<Space><Space>` anytime to see all keybindings
- Organized groups: Find, File Explorer, Split Windows, Tabs, Git, Code actions, and more
- See [Quick Reference](docs/content/quick-reference.md) for complete list

### Language Support
- **Java:** Full jdtls LSP integration with debugging (DAP) and testing support
- **Rust:** rustaceanvim with rust-analyzer LSP, crates.nvim for Cargo.toml management, codelldb debugger, and neotest integration

### Core Features
- **AI Integration:** CodeCompanion with Ollama and Gemini support for AI-assisted coding
- **Smart Completion:** nvim-cmp with LSP, buffer, path, and snippet sources
- **UI Enhancements:** Bufferline, lualine, colorschemes, indent guides
- **Theme Switcher:** Telescope-based theme picker with live preview and persistence (8 lazy-loaded themes: tokyonight, ayu_dark, catppuccin, gruvbox, onedark, nord, nightfox, kanagawa)
- **File Explorer:** Nvim-tree with custom icons and keymaps
- **Fuzzy Finder:** Telescope for fast file and text search
- **Terminal Integration:** ToggleTerm for embedded terminals with Lazygit support
- **Syntax Highlighting:** Treesitter-based syntax highlighting with LSP semantic tokens disabled for colorful highlighting
- **Plugin Management:** lazy.nvim for fast startup with lazy-loaded plugins

## Requirements

- Neovim 0.11.3 or later
- A terminal with true color (24-bit) support (iTerm2, Alacritty, Kitty, WezTerm, etc.) for proper theme display
- `rust-analyzer` for Rust development
- `jdtls` for Java development (auto-installed via nvim-java)

## Quick Start

1. **Open a file:** `nvim yourfile.rs` or `nvim YourClass.java`
2. **Press `<Space>`** and wait to see all available keybindings
3. **Essential keybindings:**
   - `<Space>ne` - Toggle file explorer
   - `<Space>ff` - Find files
   - `<Space>fs` - Search in files
   - `<Space>ct` - Change theme
   - `<Space>gg` - Open Lazygit
   - `Ctrl+7` - Toggle terminal
   - `gd` - Go to definition
   - `K` - Show documentation
   - `<Space>ca` - Code actions

See [Quick Reference](docs/content/quick-reference.md) for complete keybinding list.

## Documentation

Full documentation is available in the [docs](https://shaaf.dev/neovim/) directory, including:
- Installation guide
- Step-by-step tutorials for Java and Rust
- Plugin reference
- Complete keybinding list

## Structure

The configuration is organized in a modular structure:
- `lua/neovim4j/core/keymaps.lua` - General keybindings
- `lua/neovim4j/plugins/java.lua` - Java-specific tooling
- `lua/neovim4j/plugins/rust.lua` - Rust-specific tooling
- `lua/neovim4j/plugins/lsp/lspconfig.lua` - General LSP configuration
- `lua/neovim4j/plugins/which-key.lua` - Keybinding reference popup
- `lua/neovim4j/plugins/` - Other plugin configurations

> **Note:** The `neovim4j` directory name is historical from when this was Java-focused. It now supports multiple languages.

