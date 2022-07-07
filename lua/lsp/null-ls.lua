local status, null_ls = pcall(require, "null-ls")
if not status then
    vim.notify("没有找到 null-ls")
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    debug = false,
    sources = {
        -- Formatting ---------------------
        --  brew install shfmt
        formatting.shfmt,
        formatting.rustfmt,
        formatting.stylua,
        formatting.astyle,
        -- frontend
        formatting.prettier.with({
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "css",
                "scss",
                "less",
                "html",
                "json",
                "yaml",
                "graphql",
            },
            extra_filetypes = { "njk" },
            prefer_local = "node_modules/.bin",
        }),
        -- Diagnostics  ---------------------
        diagnostics.eslint.with({
            prefer_local = "node_modules/.bin",
        }),
        -- code actions ---------------------
        code_actions.gitsigns,
        code_actions.eslint.with({
            prefer_local = "node_modules/.bin",
        }),
    },
    -- #{m}: message
    -- #{s}: source name (defaults to null-ls if not specified)
    -- #{c}: code (if available)
    -- 提示格式： [eslint] xxx
    diagnostics_format = "[#{s}] #{m}",
})
