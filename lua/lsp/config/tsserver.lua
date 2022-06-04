local default_on_attach = require("utils.opts").default_on_attach
local ts_utils_startup = require("lsp.aux.ts_utils")

local opts = {
  on_attach = function(client, bufnr)
    default_on_attach(client, bufnr)
    ts_utils_startup(client, bufnr)
  end,
}

return opts
