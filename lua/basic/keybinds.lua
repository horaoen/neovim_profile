-- leader 键设置为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 默认的键位设置函数太长了，所以这里将它们重新引用一下
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = {noremap = true, silent = true}
}
-- 插入模下 jj 退出插入模式
vim.keybinds.gmap("i", "jj", "<Esc>", vim.keybinds.opts)

vim.keybinds.gmap("n", "<leader>q", ":q<CR>", vim.keybinds.opts)
-- 用 H 和 L 代替 ^ 与 $
vim.keybinds.gmap("n", "H", "^", vim.keybinds.opts)
vim.keybinds.gmap("v", "H", "^", vim.keybinds.opts)
vim.keybinds.gmap("n", "L", "$", vim.keybinds.opts)
vim.keybinds.gmap("v", "L", "$", vim.keybinds.opts)
-- 将 C-u 和 C-d 调整为上下滑动 10 行而不是半
vim.keybinds.gmap("n", "<C-u>", "9k", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-d>", "9j", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-j>", "4j", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-k>", "4k", vim.keybinds.opts)
-- 插入模式下的上下左右移动
vim.keybinds.gmap("i", "<A-k>", "<up>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-j>", "<down>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-h>", "<left>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-l>", "<right>", vim.keybinds.opts)
 -- Alt + hjkl  窗口之间
vim.keybinds.gmap("n", "<A-h>", "<C-w>h", vim.keybinds.opts)
vim.keybinds.gmap("n", "<A-j>", "<C-w>j", vim.keybinds.opts)
vim.keybinds.gmap("n", "<A-k>", "<C-w>k", vim.keybinds.opts)
vim.keybinds.gmap("n", "<A-l>", "<C-w>l", vim.keybinds.opts)
-- 修改分屏大小
vim.keybinds.gmap("n", "<C-up>", "<cmd>res +1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-down>", "<cmd>res -1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-left>", "<cmd>vertical resize-1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-right>", "<cmd>vertical resize+1<CR>", vim.keybinds.opts)
-- 正常模式下按 ESC 取消高亮显示
vim.keybinds.gmap("n", "<ESC>", ":nohlsearch<CR>", vim.keybinds.opts)
-- 通过 leader cs 切换拼写检查
vim.keybinds.gmap("n", "<leader>cs", "<cmd>set spell!<CR>", vim.keybinds.opts)
