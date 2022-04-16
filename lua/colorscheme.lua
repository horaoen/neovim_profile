require("catppuccin").setup({
	-- 透明背景
	transparent_background = false,
	-- 使用终端背景色
	term_color = false,
	-- 代码样式
	styles = {
		comments = "italic",
		functions = "NONE",
		keywords = "NONE",
		strings = "NONE",
		variables = "NONE",
	},

	integrations = {
		cmp = true,
		gitsigns = true,
		telescope = true,
		which_key = true,
		bufferline = true,
		markdown = true,
		ts_rainbow = true,
		hop = true,
		notify = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		nvimtree = {
			enabled = true,
			show_root = false,
			-- 透明背景
			transparent_panel = false,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
		lsp_saga = false,
	},
})
-- 应用主题
vim.cmd([[colorscheme catppuccin]])
