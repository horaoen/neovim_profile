-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
-- 设置断点样式
vim.fn.sign_define("DapBreakpoint", { text = "⊚", texthl = "TodoFgFIX", linehl = "", numhl = "" })

require("debug_adapter.config.cppdbg")
require("debug_adapter.config.python")
require("debug_adapter.config.go")
