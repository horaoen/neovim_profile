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
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("windwp/nvim-autopairs")
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")
	use("kevinhwang91/nvim-hlslens")
	use("AndrewRadev/switch.vim")
	use("ur4ltz/surround.nvim")
	use("phaazon/hop.nvim")
	use("ethanholz/nvim-lastplace")
	use("rmagatti/auto-session")
	use({
		"nvim-pack/nvim-spectre",
		requires = {
			"BurntSushi/ripgrep", -- 文字查找
		},
	})
	use("rcarriga/nvim-notify")
	use("Pocco81/AutoSave.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("mbbill/undotree")
	use("simrat39/symbols-outline.nvim")

	use({ "catppuccin/nvim", as = "catppuccin" })

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("tamago324/nlsp-settings.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("j-hui/fidget.nvim")
	use("b0o/schemastore.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("simrat39/rust-tools.nvim")

	-- lsp ui
	use("onsails/lspkind-nvim")
	use("tami5/lspsaga.nvim")

	-- cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/vim-vsnip")

	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-vsnip")

	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- dap
	use("mfussenegger/nvim-dap")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")

	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = { ":TSupdate" },
		requires = {
			"p00f/nvim-ts-rainbow",
		},
	})
	use({
		"numToStr/Comment.nvim",
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	})
	-- Git
	use("lewis6991/gitsigns.nvim")

	use("petertriho/nvim-scrollbar")

  use("gpanders/editorconfig.nvim")
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
