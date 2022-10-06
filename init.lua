-- require "lua.user.options.lua" : Other way of giving path
require "core.options"
require "core.keymaps"
require "core.colorscheme"
require "core.plugins"

-- Configurations of plugins / lsp
-- require "user.filetype-config" -- It's by default now in Neovim 0.8
require "user.cmp"
require "user.treesitter"
require "user.lualine-config"
require "user.bufferline-config"
require "user.toggleterm"
require "user.alpha"
--require "user.nnn"
require "user.autopairs"
require "user.lsp"  -- Notice here we are using directory name
-- If we use directory name then it'll automatically look for init.lua file in that directory

--   NOT USED NOW
-- require "user.nvimR"
-- require "user.netrw"  --Using nnn as file explorer now
