return {
  -- Add your plugins here
  
  -- Your other plugins
  { import = 'sshaaf.plugins.colorscheme' }, -- Example
  
  -- Terminal
  { import = 'sshaaf.plugins.terminal' },

  -- Completions for java
  { import = 'sshaaf.plugins.completions' },
  
    -- java plugin setup
  { import = 'sshaaf.plugins.java' },
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