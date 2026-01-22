return {
  -- Default theme - loads immediately only if it's the preferred theme
  {
    "folke/tokyonight.nvim",
    lazy = function()
      -- Only load immediately if tokyonight is the preferred theme or no preference set
      local preference = vim.g.theme_preference
      return preference ~= nil and preference ~= "tokyonight" and not preference:match("^tokyonight")
    end,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
      })
      -- Only apply if this is the preferred theme
      local preference = vim.g.theme_preference
      if not preference or preference == "tokyonight" or preference:match("^tokyonight") then
        vim.cmd([[colorscheme tokyonight]])
      end
    end,
  },

  -- Lazy-loaded themes (load on demand)
  { "Shatur/neovim-ayu", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },
  { "shaunsingh/nord.nvim", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
}
