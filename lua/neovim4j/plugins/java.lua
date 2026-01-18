-- ~/.config/nvim/lua/neovim4j/plugins/java.lua
-- Simple jdtls configuration without nvim-java wrapper

return {
  -------------------------------------------
  -- Mason for installing jdtls
  -------------------------------------------
  {
    'williamboman/mason.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -------------------------------------------
  -- Mason LSP Config
  -------------------------------------------
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    lazy = false,
    priority = 999,
    opts = {
      ensure_installed = { 'jdtls' },
    },
  },

  -------------------------------------------
  -- jdtls configuration
  -------------------------------------------
  {
    'mfussenegger/nvim-jdtls',
    ft = { 'java' },
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    config = function()
      local jdtls = require('jdtls')

      -- Find jdtls installation path
      local jdtls_path = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
      local config_path = jdtls_path .. '/config_mac'
      local plugins_path = jdtls_path .. '/plugins/'
      local launcher_jar = vim.fn.glob(plugins_path .. 'org.eclipse.equinox.launcher_*.jar')

      -- Data directory for workspace
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
      local workspace_dir = vim.fn.stdpath('cache') .. '/jdtls-workspace/' .. project_name

      local config = {
        cmd = {
          'java',
          '-Declipse.application=org.eclipse.jdt.ls.core.id1',
          '-Dosgi.bundles.defaultStartLevel=4',
          '-Declipse.product=org.eclipse.jdt.ls.core.product',
          '-Dlog.protocol=true',
          '-Dlog.level=ALL',
          '-Xmx1g',
          '--add-modules=ALL-SYSTEM',
          '--add-opens', 'java.base/java.util=ALL-UNNAMED',
          '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
          '-jar', launcher_jar,
          '-configuration', config_path,
          '-data', workspace_dir,
        },
        root_dir = jdtls.setup.find_root({'.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'}),
        settings = {
          java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
            completion = {
              favoriteStaticMembers = {
                "org.junit.Assert.*",
                "org.junit.jupiter.api.Assertions.*",
                "org.mockito.Mockito.*"
              },
              filteredTypes = {
                "com.sun.*",
                "io.micrometer.shaded.*",
              },
            },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
            codeGeneration = {
              toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
              },
              useBlocks = true,
            },
          }
        },
        init_options = {
          bundles = {}
        },
      }

      jdtls.start_or_attach(config)
    end,
  },
}
