-- 更多样式定制，参见：https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
-- 诊断样式定制
vim.diagnostic.config({
  -- 诊断的虚拟文本
  virtual_text = {
    -- 显示的前缀，可选项：'●', '▎', 'x'
    -- 默认是一个小方块，不是很好看，所以这里改了
    prefix = "●",
    -- 是否总是显示前缀？是的
    source = "always",
  },
  float = {
    -- 是否显示诊断来源？是的
    source = "always",
  },
  update_in_insert = false,
})

local on_attach = function(client, bufnr)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  require("keymaps").mapLSP(buf_set_keymap)
end

local servers = require("utils.servers")

for _, lsp in pairs(servers) do
  require("lspconfig")[lsp].setup({
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  })
end
