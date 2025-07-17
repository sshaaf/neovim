-- In your plugins/java.lua or a new plugins/completion.lua file

return {
  -- ... (your other plugins like nvim-java and mason)

  -------------------------------------------
  -- Autocompletion Engine & Snippets
  -------------------------------------------
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- Source for LSP
      'hrsh7th/cmp-buffer',   -- Source for buffer words
      'hrsh7th/cmp-path',     -- Source for file paths
      'L3MON4D3/LuaSnip',     -- Snippet Engine
      'saadparwaiz1/cmp_luasnip', -- Snippet Source for nvim-cmp
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- IMPORTANT: Add luasnip as a source
          { name = 'buffer' },
          { name = 'path' },
        }),
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-e>'] = cmp.mapping.abort(),
          -- Add keymaps for snippet navigation
          ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
      })
    end,
  },
}