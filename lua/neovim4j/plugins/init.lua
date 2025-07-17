return {
  -- Add your plugins here
  
  -- Your other plugins
  { import = 'neovim4j.plugins.colorscheme' }, -- Example
  
  -- Terminal
  { import = 'neovim4j.plugins.terminal' },

  -- Completions for java
  { import = 'neovim4j.plugins.completions' },
  
  -- Add AI Plugins
  { import = 'neovim4j.plugins.ai' },
  
    -- java plugin setup
  { import = 'neovim4j.plugins.java' },
  {
    'folke/tokyonight.nvim',
    lazy = false, -- Load this plugin on startup
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'tokyonight'
    end,
  },

  -- Another example: Telescope for fuzzy finding
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
}