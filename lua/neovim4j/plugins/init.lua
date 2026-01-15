return {
  -- Colorscheme
  { import = 'neovim4j.plugins.colorscheme' },

  -- Terminal
  { import = 'neovim4j.plugins.terminal' },

  -- AI Plugins (Copilot and ChatGPT)
  { import = 'neovim4j.plugins.ai' },

  -- Java plugin setup (includes LSP, DAP, Testing, and Completion)
  { import = 'neovim4j.plugins.java' },

  -- Utility plugins
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
}
