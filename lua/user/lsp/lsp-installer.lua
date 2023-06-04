local status_ok, lsp_installer = pcall(require, "mason-lspconfig")
-- mason-lspconfig: translate between lspconfig server names and mason.nvim package names (e.g. lua_ls <-> lua-language-server)
if not status_ok then
	return
end

require("mason").setup({
    PATH = "prepend", -- "skip" seems to cause the spawning error
})

local lspconfig = require("lspconfig")

-- servers installed on my devices : When you install a sever add this to this list
local servers = { "jsonls", "lua_ls","pyright","clangd","html","cssls","bashls","marksman" }
lsp_installer.setup {
	ensure_installed = servers
}

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
	 	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end


