-- 自动切换输入法（Fcitx 框架）
vim.g.FcitxToggleInput = function()
    local input_status = tonumber(vim.fn.system("fcitx-remote"))
    if input_status == 2 then
        vim.fn.system("fcitx-remote -c")
    end
end

vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")
vim.g.background_transparency = true
-- 指定 undotree 缓存存放路径
vim.g.undotree_dir = "~/.cache/nvim/undodir"
-- 指定代码片段存储路径，这个目录我们在第二章节的时候已经创建好了
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet"
-- 指定 Python 解释器路径
vim.g.python_path = "/usr/bin/python3.10"
