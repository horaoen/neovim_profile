require("nvim-lsp-setup").setup({
    default_mappings = false,
    mappings = require("keymaps").lspMaping,

    on_attach = function(client, bufnr)
        require("nvim-lsp-setup.utils").format_on_save(client)
    end,

    capabilities = vim.lsp.protocol.make_client_capabilities(),

    servers = {
        rust_analyzer = require("nvim-lsp-setup.rust-tools").setup({
            server = {
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            loadOutDirsFromCheck = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            },
        }),

        cssls = {},

        emmet_ls = {},

        html = {},

        jsonls = {},

        omnisharp = require("lsp.config.omnisharp"),

        pyright = {},

        sumneko_lua = {},

        tsserver = {},

        vuels = {},
    },
})
