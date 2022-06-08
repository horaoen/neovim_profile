local path = require("utils.path")

require("nvim-lsp-installer").setup({
    ensure_installed = require("utils.servers"),

    automatic_installation = true,

    ui = {
        check_outdated_servers_on_open = true,
        icons = {
            server_installed = "◍",
            server_pending = "◍",
            server_uninstalled = "◍",
        },
        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
        },
    },

    install_root_dir = path.join(vim.fn.stdpath("data"), "lsp_servers"),

    pip = {
        install_args = {},
    },

    log_level = vim.log.levels.INFO,

    max_concurrent_installers = 4,

    github = {
        download_url_template = "https://hub.fastgit.xyz/%s/releases/download/%s/%s",
    },
})
