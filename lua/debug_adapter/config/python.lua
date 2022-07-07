-- python3 -m pip install debugpy
vim.g.python_path = "/usr/bin/python3.10"

return {
    adapters = {
        type = "executable",
        command = "python3",
        args = { "-m", "debugpy.adapter" },
    },
    configurations = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            pythonPath = function()
                return vim.g.python_path
            end,
        },
    },
}
