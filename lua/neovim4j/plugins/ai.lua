-- ~/.config/nvim/lua/neovim4j/plugins/ai.lua
return {
  -------------------------------------------
  -- CodeCompanion.nvim - Self-Hosted AI Assistant
  -------------------------------------------
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('codecompanion').setup({
        -- Configure adapters (LLM providers)
        adapters = {
          ollama = function()
            return require('codecompanion.adapters').extend('ollama', {
              env = {
                url = 'http://localhost:11434',
              },
              schema = {
                model = {
                  default = 'deepseek-coder:6.7b',
                  -- Alternative models you can use:
                  -- 'qwen2.5-coder:7b'
                  -- 'codellama:13b'
                  -- 'starcoder2:15b'
                },
              },
            })
          end,
        },

        -- Set default strategies to use Ollama
        strategies = {
          chat = {
            adapter = 'ollama',
          },
          inline = {
            adapter = 'ollama',
          },
          agent = {
            adapter = 'ollama',
          },
        },

        -- Display settings
        display = {
          chat = {
            window = {
              layout = 'vertical', -- vertical or horizontal
              width = 0.4,
            },
          },
          inline = {
            diff = {
              enabled = true,
              close_diff_at = 'both', -- both, start, end
            },
          },
        },
      })

      -- Keybindings (matching previous ChatGPT keybindings where possible)
      local keymap = vim.keymap

      -- Chat interface
      keymap.set('n', '<leader>ac', '<cmd>CodeCompanionChat<CR>', { desc = 'AI: Open chat' })
      keymap.set('v', '<leader>ac', '<cmd>CodeCompanionChat<CR>', { desc = 'AI: Chat with selection' })

      -- Inline editing
      keymap.set('v', '<leader>ae', '<cmd>CodeCompanionInline<CR>', { desc = 'AI: Edit selection' })

      -- Explain code
      keymap.set('v', '<leader>ax', '<cmd>CodeCompanion /explain<CR>', { desc = 'AI: Explain code' })

      -- Additional useful commands
      keymap.set('n', '<leader>aa', '<cmd>CodeCompanionActions<CR>', { desc = 'AI: Show actions' })
      keymap.set('v', '<leader>aa', '<cmd>CodeCompanionActions<CR>', { desc = 'AI: Show actions' })
      keymap.set('n', '<leader>at', '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'AI: Toggle chat' })
    end,
  },
}