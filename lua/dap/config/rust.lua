local codelldb_path = "/home/horaoen/Dev/codelldb-x86_64-linux/extension/adapter/codelldb"
local liblldb_path = "/home/horaoen/Dev/codelldb-x86_64-linux/extension/lldb/lib/liblldb.so"

return {
	adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
}
