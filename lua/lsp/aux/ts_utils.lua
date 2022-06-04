local ts_utils = require("nvim-lsp-ts-utils")
local keybindings = require("keymaps")

local function ts_utils_startup(client, bufnr)
  ts_utils.setup({
    debug = false,
    disable_commands = false,
    enable_import_on_completion = false,
    import_all_timeout = 5000, -- ms
    import_all_priorities = {
      same_file = 1,
      local_files = 2,
      buffer_content = 3,
      buffers = 4,
    },
    import_all_scan_buffers = 100,
    import_all_select_source = false,
    always_organize_imports = true,
    filter_out_diagnostics_by_severity = {},
    filter_out_diagnostics_by_code = {},
    auto_inlay_hints = true,
    inlay_hints_highlight = "Comment",
    update_imports_on_move = false,
    require_confirmation_on_move = false,
    watch_dir = nil,
  })
  ts_utils.setup_client(client)

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  keybindings.mapTsLSP(buf_set_keymap)
end

return ts_utils_startup
