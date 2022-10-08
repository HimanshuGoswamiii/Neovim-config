-- Shorten function name
--local keymap = vim.api.nvim_set_keymap  -- Better in version 0.7
local keymap = vim.keymap.set
-- Now we don't have to type vim.api... to set a keymap every single time

local opts = { noremap = true, silent = false }
-- silent=true won't show commands mapped to keybindings

local term_opts = { silent = true }


--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
-- vim.g.maplocalleader = '\' , We don't need this let it set to what it is

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Lexplore : File Explorer in Neovim
keymap("n", "<leader>e", ":Lex 20<cr>", opts)
-- This will also be the mapping for toggling the Lexplore

-- Resize with arrows. Resize the splits
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)
-- A stands for Alt

-- Jump to start and End of Line
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("n", "^", "H", opts)
keymap("n", "$", "L", opts)

-- Tabs
keymap("n", "t", ":tabn<CR>", opts)
keymap("n", "T", ":tabp<CR>", opts)
keymap("n", "<leader>t", ":tabedit ", opts)

-- marks
keymap("n","<leader>m",":MarksListBuf<CR>",opts)

--          INSERT MODE KEYBINDINGS --
-- Press kj fast to enter
keymap("i", "kj", "<ESC>", opts)

-- ------------------------------------------------------------------------------
-- Visual --
-- ------------------------------------------------------------------------------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- When you select something to replace, default vim saves that selected as new copy. We have changed that
--keymap("v", "p", '"_dP', opts)  -- Creates problem when pasting from another buffer

-- -----------------------------------------------------------------------------
-- Visual Block --
-- ------------------------------------------------------------------------------
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Open terminal in split
-- keymap("n", "<leader>s", ":w <bar> 8sp <bar> term<cr>", opts)

-- nnn File Explorer
-- keymap("n","<leader>n",":NnnExplorer %:p:h<cr>",opts) -- To always open nnn in the directory of the currently active buffer, use %:p:h as argument
keymap("n","<leader>n",":NnnPicker %:p:h<cr>",opts) -- To always open nnn in the directory of the currently active buffer, use %:p:h as argument

--                   For emmet
-- Here I've used vim mappings for emmet
-- New keymappings for Emmet
vim.cmd "let g:user_emmet_mode='n' "  --Only enable in normal mode function
vim.cmd "let g:user_emmet_leader_key=',' "

-- Enable Emmet only while using html and CSS
--vim.cmd "let g:user_emmet_install_global = 0"
--vim.cmd "autocmd FileType html,css EmmetInstall"
-- NOTE: No need for these commands because now I'll load emmet only during these files

-- Telescope Keybindings
keymap("n","<leader>f",":Telescope find_files<cr>",opts)
keymap("n","<leader>fo",":Telescope oldfiles<cr>",opts)

-- Compile and Run Code
-- keymap("n","<F9>",":TermExec cmd='gcc % && ./a.out'<cr>",opts)
-- Now it's in ftplugin for filetype languages
