local opts = {
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),

	on_attach = function(client, bufnr)
		require("aerial").on_attach(client, bufnr)
		-- 禁用格式化功能，交给专门插件插件处理
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		-- 绑定快捷键
		require("keymaps").mapLSP(buf_set_keymap)
	end,
}

return {
	on_setup = function(server)
		server:setup(opts)
	end,
}
