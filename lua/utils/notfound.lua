local notfound = {}

notfound.plugin_notfound = function()
    vim.cmd([[PackerSync]])
end

return notfound
