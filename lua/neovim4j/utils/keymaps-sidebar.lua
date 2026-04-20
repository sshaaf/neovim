-- Custom keymap sidebar that shows all shortcuts on the right side
local M = {}

M.sidebar_buf = nil
M.sidebar_win = nil

-- Function to get all keymaps organized by mode and leader
local function get_all_keymaps()
	local keymaps = vim.api.nvim_get_keymap("n") -- normal mode
	local leader_maps = {}
	local other_maps = {}

	for _, map in ipairs(keymaps) do
		if map.lhs:match("^<Space>") or map.lhs:match("^<leader>") then
			table.insert(leader_maps, map)
		else
			table.insert(other_maps, map)
		end
	end

	return leader_maps, other_maps
end

-- Function to format keymap for display
local function format_keymap(map)
	local lhs = map.lhs:gsub("<Space>", "<leader>")
	local desc = map.desc or map.rhs or "No description"
	return string.format("%-20s %s", lhs, desc)
end

-- Create and populate the sidebar
function M.toggle_sidebar()
	-- If sidebar is already open, close it
	if M.sidebar_win and vim.api.nvim_win_is_valid(M.sidebar_win) then
		vim.api.nvim_win_close(M.sidebar_win, true)
		M.sidebar_win = nil
		return
	end

	-- Create a new buffer if it doesn't exist
	if not M.sidebar_buf or not vim.api.nvim_buf_is_valid(M.sidebar_buf) then
		M.sidebar_buf = vim.api.nvim_create_buf(false, true) -- unlisted scratch buffer
		vim.api.nvim_buf_set_option(M.sidebar_buf, "bufhidden", "hide")
		vim.api.nvim_buf_set_option(M.sidebar_buf, "filetype", "keymaps")
	end

	-- Create the window on the right side
	local width = 50
	vim.cmd("vsplit")
	vim.cmd("wincmd L") -- Move window to far right
	M.sidebar_win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(M.sidebar_win, M.sidebar_buf)
	vim.api.nvim_win_set_width(M.sidebar_win, width)

	-- Populate the buffer with keymaps
	local leader_maps, other_maps = get_all_keymaps()
	local lines = { "╔═══════════════════════════════════════════════╗" }
	table.insert(lines, "║           NEOVIM KEYBINDINGS                ║")
	table.insert(lines, "╚═══════════════════════════════════════════════╝")
	table.insert(lines, "")
	table.insert(lines, "📋 LEADER KEYMAPS (<Space>)")
	table.insert(lines, "─────────────────────────────────────────────────")

	for _, map in ipairs(leader_maps) do
		if map.desc and map.desc ~= "" then
			table.insert(lines, "  " .. format_keymap(map))
		end
	end

	table.insert(lines, "")
	table.insert(lines, "⌨️  OTHER KEYMAPS")
	table.insert(lines, "─────────────────────────────────────────────────")

	local added_others = false
	for _, map in ipairs(other_maps) do
		if map.desc and map.desc ~= "" and not map.lhs:match("<Plug>") then
			table.insert(lines, "  " .. format_keymap(map))
			added_others = true
			if #lines > 100 then
				break
			end -- Limit to prevent too many lines
		end
	end

	if not added_others then
		table.insert(lines, "  (Additional keymaps available via which-key)")
	end

	table.insert(lines, "")
	table.insert(lines, "Press 'q' to close | <leader>? for which-key")

	-- Set buffer contents
	vim.api.nvim_buf_set_option(M.sidebar_buf, "modifiable", true)
	vim.api.nvim_buf_set_lines(M.sidebar_buf, 0, -1, false, lines)
	vim.api.nvim_buf_set_option(M.sidebar_buf, "modifiable", false)
	vim.api.nvim_buf_set_option(M.sidebar_buf, "modified", false)

	-- Set buffer options
	vim.api.nvim_win_set_option(M.sidebar_win, "number", false)
	vim.api.nvim_win_set_option(M.sidebar_win, "relativenumber", false)
	vim.api.nvim_win_set_option(M.sidebar_win, "signcolumn", "no")
	vim.api.nvim_win_set_option(M.sidebar_win, "wrap", false)
	vim.api.nvim_win_set_option(M.sidebar_win, "cursorline", true)

	-- Add keybind to close with 'q'
	vim.api.nvim_buf_set_keymap(
		M.sidebar_buf,
		"n",
		"q",
		"<cmd>close<CR>",
		{ noremap = true, silent = true, desc = "Close sidebar" }
	)

	-- Add syntax highlighting
	vim.cmd([[
    syntax match KeymapHeader /^╔.*╗$/
    syntax match KeymapHeader /^║.*║$/
    syntax match KeymapHeader /^╚.*╝$/
    syntax match KeymapSection /^📋.*$/
    syntax match KeymapSection /^⌨️.*$/
    syntax match KeymapSeparator /^─.*$/
    syntax match KeymapKey /<leader>[a-zA-Z?]*/ contained
    syntax match KeymapKey /<[A-Z]-[a-z]>/ contained

    highlight KeymapHeader guifg=#61AFEF gui=bold
    highlight KeymapSection guifg=#C678DD gui=bold
    highlight KeymapSeparator guifg=#5C6370
    highlight KeymapKey guifg=#E06C75 gui=bold
  ]])
end

return M
