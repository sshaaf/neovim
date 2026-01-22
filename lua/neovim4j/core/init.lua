-- Load theme preference before plugins
local preference_file = vim.fn.stdpath("data") .. "/theme_preference.txt"
local file = io.open(preference_file, "r")
if file then
  local theme = file:read("*l")
  file:close()
  if theme and theme ~= "" then
    vim.g.theme_preference = theme
    -- Apply the theme after plugins are loaded
    vim.defer_fn(function()
      local ok, _ = pcall(vim.cmd, "colorscheme " .. theme)
      if not ok then
        print("Failed to load theme: " .. theme)
      end
    end, 0)
  end
end

require("neovim4j.core.options")
require("neovim4j.core.keymaps")
