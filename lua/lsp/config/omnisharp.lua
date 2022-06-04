local path = require("utils.path")
local pid = vim.fn.getpid()
local omnisharp_bin = path.join(vim.fn.getenv("HOME"), ".local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp")

local opts = {
  cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
}

return opts

