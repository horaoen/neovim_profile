local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

_ = require("lsp-config.lsp-installer")
_ = require("lsp-config.null-ls")
_ = require("lsp-config.lsp-config")
