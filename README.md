# Neovim Configuration

This repository contains a modular Neovim (v0.11.3) configuration focused on productivity, modern UI, and powerful language tooling. It leverages [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management and includes support for AI, LSP, completion, formatting, linting, and more.

> **Inspiration:**  
> This configuration was inspired by [Melkeydev's Neovim repo](https://github.com/Melkeydev/neovim) and the YouTube talk ["How I use Neovim in 2024"](https://youtu.be/bVKA4Im2yTc?feature=shared).  
> It aims to provide a beginner-friendly setup for developers who want a powerful editor out of the box.

![Screenshot](screenshot.jpg)

## Features
- **Plugin Management:** Uses `lazy.nvim` for fast, lazy-loaded plugins.
- **AI Integration:** GitHub Copilot and ChatGPT.nvim for code completion and chat.
- **LSP & Autocompletion:** Full language server support, completion, and snippets.
- **Formatting & Linting:** Automatic formatting and linting for popular languages.
- **UI Enhancements:** Bufferline, lualine, colorschemes, indent guides, and more.
- **File Explorer:** Nvim-tree with custom icons and keymaps.
- **Fuzzy Finder:** Telescope for fast file and text search.
- **Terminal Integration:** ToggleTerm for embedded terminals.
- **Keymaps:** Intuitive keybindings for navigation, splits, tabs, and plugin actions.

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
      <plugin>.lua
      lsp/
        mason.lua
        lspconfig.lua
```


## Leader Key & Keybindings

The **Leader key** is set to `<Space>`. It acts as a prefix for custom shortcuts, making commands easy to remember and execute.

### Basic Keybindings for Beginners

- **Fuzzy Search (Telescope):**
  - `<leader>ff` — Find files
  - `<leader>fg` — Live grep (search text in files)
  - `<leader>fb` — List open buffers

- **File Explorer (Nvim-tree):**
  - `<leader>e` — Toggle file explorer

- **Terminal (ToggleTerm):**
  - `<leader>tt` — Open terminal

- **Buffers:**
  - `<leader>bb` — List buffers
  - `<leader>bd` — Delete buffer

- **Gradle Build (if configured):**
  - `<leader>gb` — Run Gradle build

*You can find and customize more keymaps in [`lua/neovim4j/core/keymaps.lua`](lua/neovim4j/core/keymaps.lua).*

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
2. **Install Neovim (v0.9+)** and a true-color terminal.
3. **Open Neovim** – plugins will be installed automatically via `lazy.nvim`.
4. **Set your OpenAI API key** for ChatGPT.nvim:
   ```sh
   export OPENAI_API_KEY="your-api-key-here"
   ```
5. **Customize plugins and keymaps** in the `lua/neovim4j/plugins/` and `lua/neovim4j/core/` folders.

## Prerequisites

Before installing this configuration, make sure you have the following dependencies:

- **Nerd Font:**  
  Install a patched font for icons (recommended: FiraCode Nerd Font):
  ```sh
  brew install --cask font-firacode-nerd-font
  ```

- **Neovim:**  
  Install the latest version of Neovim:
  ```sh
  brew install neovim
  ```

- **JDK:**  
  Some language servers and build tools require Java. You can install a JDK using [sdkman](https://sdkman.io/) or Homebrew:
  ```sh
  sdk install java
  # or
  brew install openjdk
  ```

Continue with the steps in the **Getting Started** section after installing these



## Plugins Used

- [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua) — GitHub Copilot AI code completion
- [jackMort/ChatGPT.nvim](https://github.com/jackMort/ChatGPT.nvim) — ChatGPT integration for Neovim
- [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim) — UI library for Neovim plugins
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) — Lua utility functions for Neovim plugins
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — Fuzzy finder and picker
- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) — Plugin manager
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) — Colorscheme
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) — File explorer
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) — Statusline
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) — Autocompletion
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — Syntax highlighting and code parsing

*Add any additional plugins from your other plugin files as needed.*

## Customization

- **Keymaps:** See [`lua/neovim4j/core/keymaps.lua`](lua/neovim4j/core/keymaps.lua)
- **Options:** See [`lua/neovim4j/core/options.lua`](lua/neovim4j/core/options.lua)
- **Plugins:** See [`lua/neovim4j/plugins/`](lua/neovim4j/plugins/)

## License

MIT

---

Feel free to fork and adapt this config