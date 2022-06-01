local lsp_installer = require("nvim-lsp-installer")

-- 安装列表
-- { key: 语言 value: 配置文件 }
-- key 必须为下列网址列出的名称
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
	sumneko_lua = require("lsp-config.settings.sumneko_lua"), -- lua/lsp/config/lua.lua
	cssls = require("lsp-config.settings.cssls"),
	html = require("lsp-config.settings.html"),
	emmet_ls = require("lsp-config.settings.emmet"),
	jsonls = require("lsp-config.settings.jsonls"),
	tsserver = require("lsp-config.settings.tsserver"),
	vuels = require("lsp-config.settings.vuels"),
	pyright = require("lsp-config.settings.pyright"),
	rust_analyzer = require("lsp-config.settings.rust_analyzer"),
  omnisharp = require("lsp-config.settings.omnisharp"),
  prosemd_lsp = require("lsp-config.settings.prosemd_lsp"),
}
-- 自动安装 Language Servers
for name, _ in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
      vim.notify("Installing " .. name)
      server:install()
		end
	end
end

lsp_installer.on_server_ready(function(server)
	local config = servers[server.name]
	if config == nil then
		return
	end
	if config.on_setup then
		config.on_setup(server)
	else
		server:setup({})
	end
end)
