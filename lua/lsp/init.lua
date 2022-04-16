local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

_ = require("lsp.lsp-installer")
_ = require("lsp.null-ls")
_ = require("lsp.lsp-config")
