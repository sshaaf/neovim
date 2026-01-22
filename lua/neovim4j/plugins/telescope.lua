return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    -- Custom action to create a file if it doesn't exist
    local create_new_file = function(prompt_bufnr)
      local current_picker = action_state.get_current_picker(prompt_bufnr)
      local input = current_picker:_get_prompt()

      if input == "" then
        print("Please enter a file path")
        return
      end

      actions.close(prompt_bufnr)

      -- Create parent directories if they don't exist
      local parent_dir = vim.fn.fnamemodify(input, ":h")
      if parent_dir ~= "" and parent_dir ~= "." then
        vim.fn.mkdir(parent_dir, "p")
      end

      -- Open the new file
      vim.cmd("edit " .. input)
    end

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-n>"] = create_new_file, -- create new file from prompt
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fp", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

    -- Theme switcher with persistence
    keymap.set("n", "<leader>ct", function()
      local builtin = require("telescope.builtin")
      local themes = require("telescope.themes")

      builtin.colorscheme(themes.get_dropdown({
        enable_preview = true,
        attach_mappings = function(prompt_bufnr)
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)

            -- Apply the colorscheme
            vim.cmd("colorscheme " .. selection.value)

            -- Save preference to file
            local preference_file = vim.fn.stdpath("data") .. "/theme_preference.txt"
            local file = io.open(preference_file, "w")
            if file then
              file:write(selection.value)
              file:close()
              vim.g.theme_preference = selection.value
              print("Theme saved: " .. selection.value)
            end
          end)
          return true
        end,
      }))
    end, { desc = "Change colorscheme/theme" })
  end,
}
