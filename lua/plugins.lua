local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  --[[
  ========== basic ============
  --]]
  use("wbthomason/packer.nvim")
  use("lewis6991/impatient.nvim")
  use("rcarriga/nvim-notify")

  --[[
  ========== depend ===========
  --]]
  use("kyazdani42/nvim-web-devicons")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("lewis6991/gitsigns.nvim")

  --[[
  ========= theme =============
  --]]
  use({ "catppuccin/nvim", as = "catppuccin" })

  --[[
  ======= core function =======
  --]]
  use("nvim-lualine/lualine.nvim")
  use("kyazdani42/nvim-tree.lua")
  use("mbbill/undotree")
  use("akinsho/bufferline.nvim")
  use("folke/which-key.nvim")
  use("goolord/alpha-nvim")
  use("simrat39/symbols-outline.nvim")
  use("akinsho/toggleterm.nvim")
  use("nvim-telescope/telescope.nvim")

  --[[
  =========== lsp =============
  --]]
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  use("jose-elias-alvarez/null-ls.nvim")
  use("onsails/lspkind-nvim")
  use("tami5/lspsaga.nvim")
  use("j-hui/fidget.nvim")
  use("simrat39/rust-tools.nvim")
  use("tamago324/nlsp-settings.nvim")
  use("b0o/schemastore.nvim")
  use("jose-elias-alvarez/nvim-lsp-ts-utils")

  --[[
  =========== cmp =============
  --]]
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/vim-vsnip")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-vsnip")
  use("rafamadriz/friendly-snippets")
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  --[[
  ========== syntax ===========
  --]]
  use({
    "nvim-treesitter/nvim-treesitter",
    run = { ":TSupdate" },
    requires = {
      "p00f/nvim-ts-rainbow",
    },
  })

  --[[
  ========== dap ==============
  --]]
  use("mfussenegger/nvim-dap")
  use("theHamsta/nvim-dap-virtual-text")
  use("rcarriga/nvim-dap-ui")

  --[[
  ======= other function ======
  --]]
  use("moll/vim-bbye")
  use({
    "numToStr/Comment.nvim",
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  })
  use("petertriho/nvim-scrollbar")
  use("gpanders/editorconfig.nvim")
  use("ahmedkhalf/project.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("kevinhwang91/nvim-hlslens")
  use("AndrewRadev/switch.vim")
  use("ur4ltz/surround.nvim")
  use("phaazon/hop.nvim")
  use("ethanholz/nvim-lastplace")
  use("rmagatti/auto-session")
  use({
    "nvim-pack/nvim-spectre",
    requires = {
      "BurntSushi/ripgrep", 
    },
  })
  use("Pocco81/AutoSave.nvim")
  use("norcalli/nvim-colorizer.lua")
  use("davidgranstrom/nvim-markdown-preview")

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
