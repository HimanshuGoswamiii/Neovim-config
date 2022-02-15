local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()

-- LSP for R
require'lspconfig'.r_language_server.setup{
  --on_attach = on_attach_custom,
  ---- Debounce "textDocument/didChange" notifications because they are slowly
  ---- processed (seen when going through completion list with `<C-N>`)
  --flags = { debounce_text_changes = 150 },
}
