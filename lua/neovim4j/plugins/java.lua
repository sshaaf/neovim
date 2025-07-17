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
    config = function()
      -- 1. Setup nvim-java itself
      require('java').setup()

      -- 2. Define your on_attach function with all your keymaps
      local on_attach = function(client, bufnr)
        -- Keymaps for LSP actions
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>th', '<Cmd>JavaTypeHierarchy<CR>', opts)
        vim.keymap.set('n', '<leader>ch', '<Cmd>JavaCallHierarchy<CR>', opts)

        -- Keymaps for testing
        vim.keymap.set('n', '<leader>jt', function() require('java.test').run_class_tests() end, opts)
        vim.keymap.set('n', '<leader>jT', function() require('java.test').run_file_tests() end, opts)
        vim.keymap.set('n', '<leader>jm', function() require('java.test').run_method_test() end, opts)

        -- Keymaps for debugging
        vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, opts)
        vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, opts)
        vim.keymap.set('n', '<leader>dn', function() require('dap').step_over() end, opts)
        vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end, opts)
      end

      -- 3. Pass this on_attach function to the lspconfig setup
      require('lspconfig').jdtls.setup({
        on_attach = on_attach,
      })
    end,
  },

  -------------------------------------------
  -- LSP/Tool Installer
  -------------------------------------------
  {
    'williamboman/mason.nvim',
    opts = {}, -- Omit opts to use the default configuration
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      -- Ensure jdtls is automatically installed
      ensure_installed = { 'jdtls' },
    },
  },

  -------------------------------------------
  -- Autocompletion Engine
  -------------------------------------------
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path' },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-e>'] = cmp.mapping.abort(),
        }),
      })
    end,
  },
}