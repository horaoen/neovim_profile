local path = require("utils.path")
local on_attach = require("utils.opts").default_on_attach
local servers = require("utils.servers")

for _, lsp in pairs(servers) do
  local opts = {}
  local abs_path = path.join(vim.fn.stdpath("config"), "lua/lsp/config", string.format("%s.lua", lsp))
  if path.is_exists(abs_path) then
    opts = require("lsp.config." .. lsp)
  end
  if opts.on_attach == nil then
    opts.on_attach = on_attach
  end
  opts.flags = { debounce_text_changes = 150 }
  require("lspconfig")[lsp].setup(opts)
end

require("lsp.aux.rust-tools")
