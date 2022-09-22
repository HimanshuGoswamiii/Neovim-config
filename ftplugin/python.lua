--local keymap = vim.api.nvim_set_keymap  -- Better in version 0.7
local keymap = vim.keymap.set
-- Now we don't have to type vim.api... to set a keymap every single time

local opts = { noremap = true, silent = false }
-- silent=true won't show commands mapped to keybindings


keymap("n","<F9>",":TermExec cmd='python %'<cr>",opts)
