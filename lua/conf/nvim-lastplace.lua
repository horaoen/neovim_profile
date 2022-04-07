-- https://github.com/ethanholz/nvim-lastplace
require("nvim-lastplace").setup(
    {
        -- 哪些 buffer 类型不记录光标位置
        lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
        -- 哪些文件类型不记录光标位置
        lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
        lastplace_open_folds = true
    }
)
