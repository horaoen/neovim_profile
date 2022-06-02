-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
local dap = require("dap")
-- 设置断点样式
vim.fn.sign_define("DapBreakpoint", { text = "⊚", texthl = "TodoFgFIX", linehl = "", numhl = "" })

require("dap.config.cppdbg")

require("dap.config.go")
