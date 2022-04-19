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

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- basic dependency
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
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
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("folke/which-key.nvim")
	use("kevinhwang91/nvim-hlslens")
	use("AndrewRadev/switch.vim")
	use("phaazon/hop.nvim")
	use("ur4ltz/surround.nvim")
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
  use("stevearc/aerial.nvim")

	-- Colorschemes
	use("lunarvim/darkplus.nvim")
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("j-hui/fidget.nvim")
	use("b0o/schemastore.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	-- lsp ui
	use("onsails/lspkind-nvim")
	use("tami5/lspsaga.nvim")
	-- cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/vim-vsnip")

	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-vsnip")

	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  use("simrat39/rust-tools.nvim")
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
    tag = "v0.6",
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	})
	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
