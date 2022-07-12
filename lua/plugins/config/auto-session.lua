local status_ok, auto_session = pcall(require, "auto-session")
local notfound = require("utils.notfound")
if not status_ok then
    vim.cmd([[PackerSync]])
    return
end
-- https://github.com/rmagatti/auto-session
-- 推荐设置
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
auto_session.setup({
    auto_session_enable_last_session = true,
    pre_save_cmds = { "tabdo NvimTreeClose" },
})
-- 自动保存会话，但总是感觉效果不理想
vim.cmd([[
    autocmd VimLeavePre * silent! :SaveSession
]])
