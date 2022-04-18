-- https://github.com/stevearc/aerial.nvim
require("aerial").setup({
	min_width = 30,
	backends = { "treesitter", "markdown" },
	-- false 是显示所有的图标
	filter_kind = false,
	-- 将从 lspkind 和 nvim-web-devicons 中获得图标
	nerd_font = "auto",
	-- 何时更新
	update_events = "TextChanged,InsertLeave",
	-- 按键映射
	on_attach = require("keymaps").mapAerial(),
})
