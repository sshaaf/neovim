return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- Uses nvim-web-devicons by default (mini.icons is just an alternative)
	},
	config = function()
		local wk = require("which-key")

		wk.setup({})

		-- Register group names for better organization
		wk.add({
			{ "<leader>f", group = "Find (Telescope)" },
			{ "<leader>n", group = "File Explorer" },
			{ "<leader>s", group = "Split Window" },
			{ "<leader>t", group = "Tabs" },
			{ "<leader>g", group = "Git" },
			{ "<leader>c", group = "Code/Config" },
			{ "<leader>x", group = "Diagnostics/Quickfix" },
			{ "<leader>w", group = "Workspace" },
			{ "<leader>r", group = "Rename/Replace" },
			{ "<leader>e", group = "Explore" },
			{ "<leader>b", group = "Buffer" },
		})

		-- Add a keymap to show all keybindings
		vim.keymap.set("n", "<leader>?", function()
			require("which-key").show({ global = false })
		end, { desc = "Show all keybindings" })

		vim.keymap.set("n", "<leader><leader>", function()
			require("which-key").show({ global = false })
		end, { desc = "Show all keybindings" })

		-- Add keymap to toggle the persistent keymaps sidebar
		vim.keymap.set("n", "<leader>ck", function()
			require("neovim4j.utils.keymaps-sidebar").toggle_sidebar()
		end, { desc = "Toggle keymaps sidebar" })
	end,
}
