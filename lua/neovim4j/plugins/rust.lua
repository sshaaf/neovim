-- ~/.config/nvim/lua/neovim4j/plugins/rust.lua
-- Comprehensive Rust development setup based on LazyVim extras

return {
  -------------------------------------------
  -- Rustaceanvim - Primary Rust plugin
  -------------------------------------------
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    ft = { 'rust' },
    opts = {
      server = {
        on_attach = function(_, bufnr)
          -- Rustacean keybindings
          vim.keymap.set("n", "<leader>cR", function()
            vim.cmd.RustLsp('codeAction')
          end, { desc = "Code Action", buffer = bufnr })

          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp('debuggables')
          end, { desc = "Rust Debuggables", buffer = bufnr })
        end,
        default_settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },
            -- Enable check on save
            checkOnSave = true,
            -- Configure check command separately
            check = {
              command = 'clippy',
              extraArgs = { '--no-deps' },
            },
            procMacro = {
              enable = true,
              ignored = {
                ['async-trait'] = { 'async_trait' },
                ['napi-derive'] = { 'napi' },
                ['async-recursion'] = { 'async_recursion' },
              },
            },
            files = {
              excludeDirs = {
                '.direnv',
                '.git',
                '.github',
                '.gitlab',
                'bin',
                'node_modules',
                'target',
                'venv',
              },
            },
            -- Disable semantic tokens to use treesitter highlighting
            semanticHighlighting = {
              strings = {
                enable = false,
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend('keep', vim.g.rustaceanvim or {}, opts or {})
      if vim.fn.executable('rust-analyzer') == 0 then
        vim.notify(
          'rust-analyzer not found in PATH. Please install it.\nhttps://rust-analyzer.github.io/',
          vim.log.levels.WARN,
          { title = 'rustaceanvim' }
        )
      end
    end,
  },

  -------------------------------------------
  -- Crates.nvim - Cargo.toml support
  -------------------------------------------
  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },

  -------------------------------------------
  -- DAP setup for Rust debugging
  -------------------------------------------
  {
    'mfussenegger/nvim-dap',
    optional = true,
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { 'codelldb' })
        end,
      },
    },
  },

  -------------------------------------------
  -- Neotest with Rust support
  -------------------------------------------
  {
    'nvim-neotest/neotest',
    optional = true,
    opts = {
      adapters = {
        ['rustaceanvim.neotest'] = {},
      },
    },
  },

  -------------------------------------------
  -- Ensure rust-analyzer via Mason
  -------------------------------------------
  {
    'williamboman/mason-lspconfig.nvim',
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { 'rust_analyzer' })
    end,
  },

  -------------------------------------------
  -- nvim-cmp integration for crates
  -------------------------------------------
  {
    'hrsh7th/nvim-cmp',
    optional = true,
    dependencies = {
      {
        'saecki/crates.nvim',
        event = { 'BufRead Cargo.toml' },
        opts = {
          lsp = {
            enabled = true,
            actions = true,
            completion = true,
            hover = true,
          },
        },
      },
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = 'crates' })
    end,
  },
}
