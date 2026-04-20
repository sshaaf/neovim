return {
	"sudormrfbin/cheatsheet.nvim",
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		require("cheatsheet").setup({
			bundled_cheatsheets = {
				enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
				disabled = { "nerd-fonts" },
			},
			bundled_plugin_cheatsheets = {
				enabled = {
					"auto-session",
					"goto-preview",
					"telescope.nvim",
					"vim-easy-align",
					"vim-sandwich",
				},
			},
			include_only_installed_plugins = true,
			telescope_mappings = {
				["<CR>"] = require("cheatsheet.telescope.actions").select_or_fill_commandline,
			},
		})

		-- Keymap to toggle cheatsheet
		vim.keymap.set("n", "<leader>cs", "<cmd>Cheatsheet<CR>", { desc = "Open Cheatsheet" })
	end,
}
