-- ~/.config/nvim/lua/neovim4j/plugins/ai.lua
return {
  -- 1. AI Code Completion: GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<Tab>",
            dismiss = "<C-e>",
          },
        },
      })
    end,
  },

  -- 2. AI Chat and Commands: ChatGPT.nvim (OpenAI)
  -- dont forget to: export OPENAI_API_KEY="your-api-key-here"
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("chatgpt").setup({
        -- Optional: Set the default model to GPT-4
        model = "gpt-4.1-2025-04-14",
        -- Optional: Set the API key environment variable
        api_key_var = "OPENAI_API_KEY",
      })

      -- Add some useful keymaps
      local keymap = vim.keymap
      keymap.set("n", "<leader>ac", "<cmd>ChatGPT<CR>", { desc = "ChatGPT: Chat" })
      keymap.set("v", "<leader>ae", "<cmd>ChatGPTEditWithInstructions<CR>", { desc = "ChatGPT: Edit with instructions" })
      keymap.set("n", "<leader>ag", "<cmd>ChatGPTCompleteCode<CR>", { desc = "ChatGPT: Complete code" })
      keymap.set("v", "<leader>ax", "<cmd>ChatGPTExplain<CR>", { desc = "ChatGPT: Explain code" })
    end,
  },
}