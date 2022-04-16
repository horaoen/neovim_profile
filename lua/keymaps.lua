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
keymap("n", "<leader>q", "<cmd>wq<cr>", opts)
keymap("n", "<leader>Q", "<cmd>wqa<cr>", opts)
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

-- telescope
keymap(
	"n",
	"<leader>f",
	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	opts
)
keymap("n", "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", opts)

-- nvim-tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

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
end

-- typescript
pluginKeys.mapTsLSP = function(mapbuf)
	mapbuf("n", "gs", ":TSLspOrganize<CR>", opts)
	mapbuf("n", "gr", ":TSLspRenameFile<CR>", opts)
	mapbuf("n", "gi", ":TSLspImportAll<CR>", opts)
end

return pluginKeys
