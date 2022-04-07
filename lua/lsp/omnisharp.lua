local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
local omnisharp_bin = "/home/horaoen/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp"
return {
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
}
