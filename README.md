# Neovim Configuration for Java Development

This repository contains a streamlined Neovim (v0.11.3) configuration optimized specifically for **Java development**. It leverages [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management and includes Java-specific LSP, debugging, testing, AI integration, and modern productivity tools.

> **Inspiration:**
> This configuration was inspired by [Melkeydev's Neovim repo](https://github.com/Melkeydev/neovim) and the YouTube talk ["How I use Neovim in 2024"](https://youtu.be/bVKA4Im2yTc?feature=shared).
> It has been simplified and optimized for Java-only development.

![Screenshot](screenshot.jpg)

## Features
- **Java-Specific Tooling:** Full jdtls LSP integration with nvim-java for Java development, debugging (DAP), and testing
- **AI Integration:** GitHub Copilot and ChatGPT.nvim for code completion and chat
- **Smart Completion:** nvim-cmp with LSP, buffer, path, and snippet sources
- **UI Enhancements:** Bufferline, lualine, colorschemes, indent guides
- **File Explorer:** Nvim-tree with custom icons and keymaps
- **Fuzzy Finder:** Telescope for fast file and text search
- **Terminal Integration:** ToggleTerm for embedded terminals
- **Syntax Highlighting:** Treesitter configured for Java, XML, JSON, and essential formats
- **Plugin Management:** Uses lazy.nvim for fast, lazy-loaded plugins

## Structure

```
init.lua
lua/
  neovim4j/
    init.lua
    lazy.lua
    core/
      init.lua
      keymaps.lua
      options.lua
    plugins/
      java.lua           # Java LSP, DAP, testing, completion
      ai.lua             # Copilot & ChatGPT
      telescope.lua      # Fuzzy finder
      nvim-tree.lua      # File explorer
      lualine.lua        # Status line
      bufferline.lua     # Buffer tabs
      terminal.lua       # Terminal integration
      treesitter.lua     # Syntax highlighting (Java-focused)
      ...
      lsp/
        mason.lua        # LSP installer (jdtls only)
        lspconfig.lua    # LSP configuration
```

## Java Development Features

### Language Server (jdtls)
- Full LSP support via nvim-java and jdtls
- Code navigation (go to definition, references, implementations)
- Code actions and refactoring
- Smart rename
- Diagnostics and error highlighting
- Type hierarchy and call hierarchy

### Debugging (DAP)
- Java debugging with nvim-dap
- Breakpoint management
- Step through code (over, into, out)
- Variable inspection

### Testing
- Run JUnit tests from within Neovim
- Test class, file, or individual methods
- Integrated test results

### Java-Specific Keybindings

**LSP Actions:**
- `gd` — Go to definition
- `K` — Show hover documentation
- `gi` — Go to implementation
- `<leader>ca` — Code actions
- `<leader>rn` — Smart rename
- `gr` — Show references
- `<leader>th` — Type hierarchy
- `<leader>ch` — Call hierarchy

**Testing:**
- `<leader>jt` — Run class tests
- `<leader>jT` — Run file tests
- `<leader>jm` — Run method test

**Debugging:**
- `<leader>db` — Toggle breakpoint
- `<leader>dc` — Continue/start debugging
- `<leader>dn` — Step over
- `<leader>di` — Step into

## Leader Key & General Keybindings

The **Leader key** is set to `<Space>`.

### General Keybindings

- **Fuzzy Search (Telescope):**
  - `<leader>fp` — Find files
  - `<leader>fr` — Recent files
  - `<leader>fs` — Live grep

- **File Explorer (Nvim-tree):**
  - `<leader>ne` — Toggle file explorer

- **Terminal (ToggleTerm):**
  - `<leader>CTRL+7` — Open terminal

- **LSP Diagnostics:**
  - `<leader>D` — Show buffer diagnostics
  - `<leader>d` — Show line diagnostics
  - `[d` — Previous diagnostic
  - `]d` — Next diagnostic
  - `<leader>rs` — Restart LSP

*You can find and customize more keymaps in [`lua/neovim4j/core/keymaps.lua`](lua/neovim4j/core/keymaps.lua) and [`lua/neovim4j/plugins/java.lua`](lua/neovim4j/plugins/java.lua).*

## AI Integration

This configuration provides seamless integration with two powerful AI tools: **GitHub Copilot** for code completion and **ChatGPT.nvim** for conversational AI and code editing.

### ChatGPT.nvim (OpenAI)

To use ChatGPT features, you must set your OpenAI API key as an environment variable before launching Neovim:

```sh
export OPENAI_API_KEY="your-api-key-here"
```

The configuration sets a default model (e.g. `gpt-4.1-2025-04-14`), but you can change this in your plugin settings if you prefer a different model.

**Useful ChatGPT.nvim Keybindings:**

- `<leader>ac` — Start a ChatGPT chat
- `<leader>ae` — Edit selected code with instructions (visual mode)
- `<leader>ag` — Complete code with ChatGPT
- `<leader>ax` — Explain selected code (visual mode)

### GitHub Copilot

To authenticate or reset your Copilot credentials:

1. Open Neovim.
2. Run the logout command to clear old credentials:
   ```
   :Copilot logout
   ```
3. Run the authentication command:
   ```
   :Copilot auth
   ```
   This will provide a user code and a GitHub URL. Open the URL in your browser and enter the code to authorize Neovim.
4. After authorizing, check your status in Neovim:
   ```
   :Copilot status
   ```

**Useful Copilot Keybindings:**

- `<Tab>` — Accept Copilot suggestion
- `<C-e>` — Dismiss Copilot suggestion

You can further customize Copilot and ChatGPT settings in `lua/neovim4j/plugins/ai.lua`.

## Getting Started

1. **Clone this repo** into your Neovim config directory (e.g. `~/.config/nvim`).
2. **Install prerequisites** (see below).
3. **Open Neovim** – plugins will be installed automatically via `lazy.nvim`.
4. **Set your OpenAI API key** for ChatGPT.nvim (optional):
   ```sh
   export OPENAI_API_KEY="your-api-key-here"
   ```
5. **Read the detailed guide**: See [GETTING_STARTED.md](GETTING_STARTED.md) for a comprehensive tutorial on:
   - Writing your first Java program
   - Using code completion and IntelliSense
   - Creating classes and packages
   - Debugging Java applications
   - Navigating code (go to definition, find references, etc.)
   - Moving between buffers
   - Testing with JUnit
6. **Customize plugins and keymaps** in the `lua/neovim4j/plugins/` and `lua/neovim4j/core/` folders.

## Prerequisites

Before installing this configuration, make sure you have the following dependencies:

- **Nerd Font:**
  Install a patched font for icons (recommended: FiraCode Nerd Font):
  ```sh
  brew install --cask font-firacode-nerd-font
  ```

- **Neovim:**
  Install the latest version of Neovim (0.9+):
  ```sh
  brew install neovim
  ```

- **JDK:**
  Java Development Kit is required for jdtls and Java development. You can install a JDK using [sdkman](https://sdkman.io/) or Homebrew:
  ```sh
  sdk install java
  # or
  brew install openjdk
  ```

- **Maven/Gradle (optional):**
  For Java project builds:
  ```sh
  sdk install maven
  sdk install gradle
  ```

## Key Plugins

- **[nvim-java/nvim-java](https://github.com/nvim-java/nvim-java)** — Complete Java development suite
- **[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** — LSP configuration
- **[williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)** — LSP installer
- **[mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)** — Debug Adapter Protocol
- **[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** — Autocompletion
- **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** — Syntax highlighting
- **[zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua)** — GitHub Copilot AI
- **[jackMort/ChatGPT.nvim](https://github.com/jackMort/ChatGPT.nvim)** — ChatGPT integration
- **[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** — Fuzzy finder
- **[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** — File explorer
- **[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** — Statusline
- **[folke/lazy.nvim](https://github.com/folke/lazy.nvim)** — Plugin manager
- **[folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** — Colorscheme

## Customization

- **Keymaps:** See [`lua/neovim4j/core/keymaps.lua`](lua/neovim4j/core/keymaps.lua)
- **Options:** See [`lua/neovim4j/core/options.lua`](lua/neovim4j/core/options.lua)
- **Java Settings:** See [`lua/neovim4j/plugins/java.lua`](lua/neovim4j/plugins/java.lua)
- **Other Plugins:** See [`lua/neovim4j/plugins/`](lua/neovim4j/plugins/)

## License

MIT

---

**Note:** This is a Java-only configuration. All non-Java language servers, formatters, and linters have been removed for simplicity and performance.
