local status_ok, lspconfig = pcall( require, "lspconfig")
if not status_ok then
	return
end
-- termux has pkg in lua-language-server
-- lspinstaller cant download sumneko_lua since it doesn't have a version but ¯\_(ツ)_/¯
local opts = {
	on_attach = require("usr.lsp.handlers").on_attach,
	capabilities = require("usr.lsp.handlers").capabilities
}

local sumneko_lua_opts = require("usr.lsp.settings.sumneko_lua");
opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts);

lspconfig.sumneko_lua.setup(opts)
