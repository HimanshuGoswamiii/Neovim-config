-- If lspconfig is not available then just retun and don't setup anything for lsp
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- SETUP
require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()

-- LSP for R
--require'lspconfig'.r_language_server.setup{
--}
