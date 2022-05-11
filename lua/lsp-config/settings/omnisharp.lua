local pid = vim.fn.getpid()
local omnisharp_bin ="/home/horaoen/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp"

local opts = {
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),

	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },

	on_attach = function(client, bufnr)
		-- 禁用格式化功能，交给专门插件插件处理
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false

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
