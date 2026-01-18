---
title: "Plugin Dependencies"
weight: 5
bookToc: true
---

# Plugin Dependencies

This page lists all the plugins that power the Neovim4J configuration, including their versions and descriptions.

## Core Infrastructure

### lazy.nvim
- **Version**: 306a05526ada86a7b30af95c5cc81ffba93fef97
- **Description**: Modern plugin manager for Neovim with lazy loading support
- **Repository**: [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

### plenary.nvim
- **Version**: b9fd5226c2f76c951fc8ed5923d85e4de065e509
- **Description**: Lua utility library used by many Neovim plugins
- **Repository**: [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

### nvim-web-devicons
- **Version**: 803353450c374192393f5387b6a0176d0972b848
- **Description**: File type icons for Neovim
- **Repository**: [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

## LSP & Language Support

### nvim-lspconfig
- **Version**: 92ee7d42320edfbb81f3cad851314ab197fa324a
- **Description**: Quickstart configurations for Neovim LSP
- **Repository**: [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

### mason.nvim
- **Version**: 44d1e90e1f66e077268191e3ee9d2ac97cc18e65
- **Description**: Portable package manager for LSP servers, DAP servers, linters, and formatters
- **Repository**: [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)

### mason-lspconfig.nvim
- **Version**: 80c0130c5f16b551865a69e832f1feadeedb5fbe
- **Description**: Extension to mason.nvim that bridges mason with lspconfig
- **Repository**: [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)

### nvim-jdtls
- **Version**: f73731b543f5971e0da9665eb1d7ceffe1fde71f
- **Description**: Extensions for the built-in Language Server Protocol support for eclipse.jdt.ls (Java language server)
- **Repository**: [mfussenegger/nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)

### neodev.nvim
- **Version**: 46aa467dca16cf3dfe27098042402066d2ae242d
- **Description**: Neovim Lua development with type checking and documentation
- **Repository**: [folke/neodev.nvim](https://github.com/folke/neodev.nvim)

### nvim-lsp-file-operations
- **Version**: b9c795d3973e8eec22706af14959bc60c579e771
- **Description**: Neovim plugin that adds support for file operations using built-in LSP
- **Repository**: [antosha417/nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations)

## Code Completion

### nvim-cmp
- **Version**: 85bbfad83f804f11688d1ab9486b459e699292d6
- **Description**: Auto-completion plugin for Neovim
- **Repository**: [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

### cmp-nvim-lsp
- **Version**: cbc7b02bb99fae35cb42f514762b89b5126651ef
- **Description**: nvim-cmp source for Neovim's built-in LSP
- **Repository**: [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)

### cmp-buffer
- **Version**: b74fab3656eea9de20a9b8116afa3cfc4ec09657
- **Description**: nvim-cmp source for buffer words
- **Repository**: [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)

### cmp-path
- **Version**: c642487086dbd9a93160e1679a1327be111cbc25
- **Description**: nvim-cmp source for filesystem paths
- **Repository**: [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)

### cmp_luasnip
- **Version**: 98d9cb5c2c38532bd9bdb481067b20fea8f32e90
- **Description**: nvim-cmp source for LuaSnip snippets
- **Repository**: [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)

### lspkind.nvim
- **Version**: 53374a2dbcb959f1d0d5d3cf6c47c4b029151c6e
- **Description**: VSCode-like pictograms for Neovim LSP completion items
- **Repository**: [onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim)

### LuaSnip
- **Version**: 5a1e39223db9a0498024a77b8441169d260c8c25
- **Description**: Snippet engine for Neovim written in Lua
- **Repository**: [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)

### friendly-snippets
- **Version**: 572f5660cf05f8cd8834e096d7b4c921ba18e175
- **Description**: Collection of pre-configured snippets for different languages
- **Repository**: [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

## Code Navigation & Search

### telescope.nvim
- **Version**: a0bbec21143c7bc5f8bb02e0005fa0b982edc026 (branch: 0.1.x)
- **Description**: Highly extendable fuzzy finder over lists
- **Repository**: [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

### telescope-fzf-native.nvim
- **Version**: 6fea601bd2b694c6f2ae08a6c6fab14930c60e2c
- **Description**: FZF sorter for Telescope written in C for better performance
- **Repository**: [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)

### nvim-treesitter
- **Version**: 42fc28ba918343ebfd5565147a42a26580579482
- **Description**: Neovim Treesitter configurations and abstraction layer for syntax parsing and highlighting
- **Repository**: [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

### trouble.nvim
- **Version**: bd67efe408d4816e25e8491cc5ad4088e708a69a
- **Description**: Pretty list for showing diagnostics, references, quickfix and location lists
- **Repository**: [folke/trouble.nvim](https://github.com/folke/trouble.nvim)

## Editing Enhancements

### nvim-autopairs
- **Version**: c2a0dd0d931d0fb07665e1fedb1ea688da3b80b4
- **Description**: Autopairs plugin for Neovim that auto-closes brackets and quotes
- **Repository**: [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)

### nvim-surround
- **Version**: 1098d7b3c34adcfa7feb3289ee434529abd4afd1
- **Description**: Add/change/delete surrounding delimiter pairs with ease
- **Repository**: [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)

### indent-blankline.nvim
- **Version**: 005b56001b2cb30bfa61b7986bc50657816ba4ba
- **Description**: Indentation guides for Neovim
- **Repository**: [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

### todo-comments.nvim
- **Version**: 31e3c38ce9b29781e4422fc0322eb0a21f4e8668
- **Description**: Highlight and search for TODO, FIXME, and other comment annotations
- **Repository**: [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

## UI & Appearance

### tokyonight.nvim
- **Version**: 5da1b76e64daf4c5d410f06bcb6b9cb640da7dfd
- **Description**: Clean, dark Neovim color scheme
- **Repository**: [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

### lualine.nvim
- **Version**: 47f91c416daef12db467145e16bed5bbfe00add8
- **Description**: Fast and easy to configure Neovim statusline
- **Repository**: [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

### bufferline.nvim
- **Version**: 655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3
- **Description**: Snazzy bufferline/tabline for Neovim
- **Repository**: [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

### which-key.nvim
- **Version**: 3aab2147e74890957785941f0c1ad87d0a44c15a
- **Description**: Displays available keybindings in popup
- **Repository**: [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

## File Management

### nvim-tree.lua
- **Version**: ca8d82fff26cb12ced239713e3222f4a9dcd0da0
- **Description**: File explorer tree for Neovim
- **Repository**: [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

## Terminal & Integration

### toggleterm.nvim
- **Version**: 50ea089fc548917cc3cc16b46a8211833b9e3c7c
- **Description**: Persist and toggle multiple terminals during an editing session
- **Repository**: [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

### vim-tmux-navigator
- **Version**: c45243dc1f32ac6bcf6068e5300f3b2b237e576a
- **Description**: Seamless navigation between tmux panes and Vim splits
- **Repository**: [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

### vim-maximizer
- **Version**: 2e54952fe91e140a2e69f35f22131219fcd9c5f1
- **Description**: Maximize and restore current window in Vim
- **Repository**: [szw/vim-maximizer](https://github.com/szw/vim-maximizer)

## Debugging

### nvim-dap
- **Version**: cdfd55a133f63228c55f91378f12908cb2a78ded
- **Description**: Debug Adapter Protocol client implementation for Neovim
- **Repository**: [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)

## AI Assistant

### codecompanion.nvim
- **Version**: ed4abfb1c328c1f4c50d6d26e6eb0ebf0ef1d2a0
- **Description**: AI-powered coding assistant for Neovim with support for various LLM providers
- **Repository**: [olimorris/codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim)

## Managing Plugins

To manage these plugins, use the following commands:

### Lazy.nvim Commands

- `:Lazy` - Open plugin manager UI
- `:Lazy sync` - Update and clean plugins
- `:Lazy update` - Update all plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy check` - Check for updates
- `:Lazy restore` - Restore plugins to lockfile state

### Mason Commands

- `:Mason` - Open Mason UI for LSP/DAP/linter management
- `:MasonUpdate` - Update Mason registry
- `:MasonInstall <package>` - Install a package
- `:MasonUninstall <package>` - Uninstall a package

## Version Information

This documentation reflects the plugin versions as of **January 18, 2026**. Versions are locked in `lazy-lock.json` to ensure reproducible builds.

To update to the latest versions:
```vim
:Lazy sync
```

---

For keybindings and usage, see [Quick Reference]({{< relref "/quick-reference" >}})
