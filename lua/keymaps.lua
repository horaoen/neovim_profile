local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 默认的键位设置函数太长了，所以这里将它们重新引用一下
vim.keybinds = {
	gmap = vim.api.nvim_set_keymap,
	bmap = vim.api.nvim_buf_set_keymap,
	dgmap = vim.api.nvim_del_keymap,
	dbmap = vim.api.nvim_buf_del_keymap,
	opts = { noremap = true, silent = true },
}

-- Edit
keymap("n", "<leader>q", "<cmd>q<cr>", opts)
keymap("n", "<leader>Q", "<cmd>qa<cr>", opts)
keymap("n", "<leader>w", "<cmd>w<cr>", opts)
keymap("i", "<leader>q", "<cmd>wq<cr>", opts)
keymap("i", "<leader>Q", "<cmd>wqa<cr>", opts)
keymap("i", "<leader>w", "<cmd>w<cr>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- pugin keymap
local pluginKeys = {}

-- nvim-tree
pluginKeys.nvimtreeList = {
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	{ key = "<C-e>", action = "edit_in_place" },
	{ key = { "O" }, action = "edit_no_picker" },
	{ key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
	{ key = "<C-v>", action = "vsplit" },
	{ key = "<C-x>", action = "split" },
	{ key = "<C-t>", action = "tabnew" },
	{ key = "<", action = "prev_sibling" },
	{ key = ">", action = "next_sibling" },
	{ key = "P", action = "parent_node" },
	{ key = "<BS>", action = "close_node" },
	{ key = "<Tab>", action = "preview" },
	{ key = "K", action = "first_sibling" },
	{ key = "J", action = "last_sibling" },
	{ key = "I", action = "toggle_git_ignored" },
	{ key = "H", action = "toggle_dotfiles" },
	{ key = "R", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "D", action = "trash" },
	{ key = "r", action = "rename" },
	{ key = "<C-r>", action = "full_rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "y", action = "copy_name" },
	{ key = "Y", action = "copy_path" },
	{ key = "gy", action = "copy_absolute_path" },
	{ key = "[c", action = "prev_git_item" },
	{ key = "]c", action = "next_git_item" },
	{ key = "-", action = "dir_up" },
	{ key = "s", action = "system_open" },
	{ key = "q", action = "close" },
	{ key = "g?", action = "toggle_help" },
	{ key = "W", action = "collapse_all" },
	{ key = "S", action = "search_node" },
	{ key = "<C-k>", action = "toggle_file_info" },
	{ key = ".", action = "run_file_command" },
}

pluginKeys.SymbolList = {
	close = { "<Esc>", "q" },
	goto_location = "<Cr>",
	focus_location = "o",
	hover_symbol = "<leader>hs",
	toggle_preview = "P",
	rename_symbol = "r",
	code_actions = "a",
}

-- nvim-bbye
keymap("n", "<leader>c", "<cmd>Bdelete<cr>", opts)

--telescope
keymap(
	"n",
	"<leader>f",
	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	opts
)
keymap("n", "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", opts)

-- nvim-tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<leader>ff", "<cmd>NvimTreeFindFile<CR>", opts)

-- packer
keymap("n", "<leader>pc", "<cmd>PackerCompile<cr>", opts)
keymap("n", "<leader>pi", "<cmd>PackerInstall<cr>", opts)
keymap("n", "<leader>ps", "<cmd>PackerSync<cr>", opts)
keymap("n", "<leader>pS", "<cmd>PackerStatus<cr>", opts)
keymap("n", "<leader>pu", "<cmd>PackerUpdate<cr>", opts)

-- lsp
pluginKeys.mapLSP = function(mapbuf)
	mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opts)
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts)
	-- diagnostic
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	mapbuf("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
end

-- nvim-dap
pluginKeys.mapDAP = function()
	keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", opts)
	keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
	keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
	keymap("n", "<F6>", "<cmd>lua require'dap'.step_into()<CR>", opts)
	keymap("n", "<F7>", "<cmd>lua require'dap'.step_over()<CR>", opts)
	keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<CR>", opts)
	keymap("n", "<F9>", "<cmd>lua require'dap'.run_last()<CR>", opts)
	keymap(
		"n",
		"<F10>",
		"<cmd>lua require'dap'.close()<CR><cmd>lua require'dap.repl'.close()<CR><cmd>lua require'dapui'.close()<CR><cmd>DapVirtualTextForceRefresh<CR>",
		opts
	)
end

-- typescript
pluginKeys.mapTsLSP = function(mapbuf)
	mapbuf("n", "gs", ":TSLspOrganize<CR>", opts)
	mapbuf("n", "gr", ":TSLspRenameFile<CR>", opts)
	mapbuf("n", "gi", ":TSLspImportAll<CR>", opts)
end

-- comment
pluginKeys.comment = {
	-- Normal 模式快捷键
	toggler = {
		line = "gcc", -- 行注释
		block = "gbc", -- 块注释
	},
	-- Visual 模式
	opleader = {
		line = "gc",
		bock = "gb",
	},
}

-- cmp
pluginKeys.cmp = function(cmp)
	return {

		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	}
end
return pluginKeys
