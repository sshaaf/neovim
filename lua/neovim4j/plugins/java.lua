-- ~/.config/nvim/lua/neovim4j/plugins/java.lua

return {
  -------------------------------------------
  -- Core Java Setup (LSP, DAP, Testing)
  -------------------------------------------
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
    },
    ft = { 'java' }, -- Load only for Java files
    config = function()
      -- Setup nvim-java itself
      require('java').setup()
    end,
  },
}
