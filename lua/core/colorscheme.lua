-- vim.cmd "colorscheme codemonkey"
-- Instead of this we will use local

vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
local colorscheme = "monokai"

-- When the i first used only the above line, the colorscheme didn't applied
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
